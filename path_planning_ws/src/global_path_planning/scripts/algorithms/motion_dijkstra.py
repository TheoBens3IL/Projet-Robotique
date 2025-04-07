#!/usr/bin/env python

"""
Motion-optimized Dijkstra's algorithm for dynamic path smoothing
Author: Théo Bens
Date: 07/04/2025
"""

import rospy
import numpy as np
from algorithms.neighbors import find_neighbors

def motion_dijkstra(start_index, goal_index, width, height, costmap, resolution, origin, grid_viz, previous_plan_variables):
    ''' 
    Dijkstra avec contraintes de mouvement (vitesse/accélération).
    Sortie : Chemin lissé + vitesses recommandées.
    '''
    open_list = []
    closed_list = set()
    parents = dict()
    g_costs = dict()
    velocity_profiles = {}  # Stocke les vitesses par nœud

    g_costs[start_index] = 0
    velocity_profiles[start_index] = 0.0  # Vitesse initiale = 0
    open_list.append([start_index, 0])

    shortest_path = []
    rospy.loginfo('Motion Dijkstra: Initialization complete')

    while open_list:
        open_list.sort(key=lambda x: x[1])
        current_node, current_g_cost = open_list.pop(0)
        closed_list.add(current_node)

        grid_viz.set_color(current_node, "pale yellow")

        if current_node == goal_index:
            break

        neighbors = find_neighbors(current_node, width, height, costmap, resolution)

        for neighbor_index, step_cost in neighbors:
            if neighbor_index in closed_list:
                continue

            # Contrainte dynamique : pénalise les virages serrés
            if previous_plan_variables and "parents" in previous_plan_variables:
                parent_node = previous_plan_variables["parents"].get(current_node, None)
                if parent_node:
                    angle_change = _compute_angle_change(parent_node, current_node, neighbor_index, width)
                    step_cost *= (1.0 + 0.5 * abs(angle_change))  # Pénalité pour les virages

            new_g_cost = g_costs[current_node] + step_cost

            in_open_list = False
            for idx, element in enumerate(open_list):
                if element[0] == neighbor_index:
                    in_open_list = True
                    break

            if in_open_list:
                if new_g_cost < g_costs[neighbor_index]:
                    g_costs[neighbor_index] = new_g_cost
                    parents[neighbor_index] = current_node
                    open_list[idx] = [neighbor_index, new_g_cost]
            else:
                g_costs[neighbor_index] = new_g_cost
                parents[neighbor_index] = current_node
                open_list.append([neighbor_index, new_g_cost])
                grid_viz.set_color(neighbor_index, 'orange')

    # Reconstruction du chemin
    if goal_index in parents:
        node = goal_index
        while node != start_index:
            shortest_path.append(node)
            node = parents[node]
        shortest_path.append(start_index)
        shortest_path = shortest_path[::-1]

        # Lissage du chemin (simplification)
        smoothed_path = _smooth_path(shortest_path, width, height)
        rospy.loginfo('Motion Dijkstra: Path smoothed and optimized')
        return smoothed_path, {"parents": parents, "velocities": velocity_profiles}

    rospy.logwarn('Motion Dijkstra: No path found')
    return [], None

def _compute_angle_change(node1, node2, node3, width):
    """ Calcule l'angle entre 3 nœuds pour estimer la courbure. """
    x1, y1 = node1 % width, node1 // width
    x2, y2 = node2 % width, node2 // width
    x3, y3 = node3 % width, node3 // width
    vec1 = np.array([x2 - x1, y2 - y1])
    vec2 = np.array([x3 - x2, y3 - y2])
    return np.arccos(np.dot(vec1, vec2) / (np.linalg.norm(vec1) * np.linalg.norm(vec2)))

def _smooth_path(path, width, height):
    """ Supprime les nœuds redondants pour lisser la trajectoire. """
    if len(path) < 3:
        return path
    smoothed = [path[0]]
    for i in range(1, len(path)-1):
        prev = smoothed[-1]
        next_node = path[i+1]
        # Garde le nœud s'il y a un changement de direction
        if _compute_angle_change(prev, path[i], next_node, width) > 0.1:  # Seuil arbitraire
            smoothed.append(path[i])
    smoothed.append(path[-1])
    return smoothed
