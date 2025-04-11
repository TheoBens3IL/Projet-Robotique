#!/usr/bin/env python
import math
import heapq
from typing import List, Tuple, Optional

def hybrid_a_star(start_index: int, goal_index: int, width: int, height: int, 
                 costmap: List[int], resolution: float, origin: Tuple[float, float, float], 
                 viz=None, previous_plan_variables=None) -> Tuple[List[int], None]:
    """
    A*-like motion planning with kinematic constraints
    
    Args:
        start_index: Start position index in grid
        goal_index: Goal position index in grid
        width: Grid width
        height: Grid height
        costmap: 1D grid costmap
        resolution: Grid resolution (m/cell)
        origin: (x,y,z) origin of grid
        viz: Visualization object
        previous_plan_variables: Not used (for API consistency)
    
    Returns:
        Tuple containing:
        - Path as list of grid indices
        - None (for compatibility with other planners)
    """
    
    # ========== Configuration ==========
    DT = 0.5  # Time step
    MOTIONS = [
        (0.5, 0.0),   # Straight
        (0.4, 0.3),    # Gentle turn
        (0.4, -0.3)    # Gentle turn opposite
    ]
    
    # ========== Helper Functions ==========
    def world_to_grid(x: float, y: float) -> Tuple[int, int]:
        return (int((x - origin[0]) / resolution), 
                int((y - origin[1]) / resolution))

    def heuristic(x1: float, y1: float, x2: float, y2: float) -> float:
        return math.sqrt((x2-x1)**2 + (y2-y1)**2)

    # ========== Initialization ==========
    start_x = (start_index % width) * resolution + origin[0]
    start_y = (start_index // width) * resolution + origin[1]
    goal_x = (goal_index % width) * resolution + origin[0]
    goal_y = (goal_index // width) * resolution + origin[1]

    # We track (x, y, theta) but the heuristic remains pure 2D like classic A*
    open_list = []
    heapq.heappush(open_list, (0, 0, start_x, start_y, 0))  # (f, g, x, y, θ)
    
    came_from = {}  # Stores (x,y,θ) -> (x,y,θ)
    g_values = {(start_x, start_y, 0): 0}
    closed_set = set()

    # ========== Main Loop ==========
    while open_list:
        current_f, current_g, x, y, theta = heapq.heappop(open_list)

        # Check if reached goal (2D position only)
        if math.hypot(x - goal_x, y - goal_y) < resolution:
            path = []
            while (x, y, theta) in came_from:
                path.append((x, y))
                x, y, theta = came_from[(x, y, theta)]
            path.append((start_x, start_y))
            path_indices = [int((y-origin[1])/resolution)*width + int((x-origin[0])/resolution) 
                          for x,y in reversed(path)]
            return path_indices, None

        if (x, y, theta) in closed_set:
            continue
        closed_set.add((x, y, theta))

        # Generate motions
        for v, omega in MOTIONS:
            new_theta = theta + omega * DT
            new_x = x + v * math.cos(new_theta) * DT
            new_y = y + v * math.sin(new_theta) * DT

            # Convert to grid and check collisions
            gx, gy = world_to_grid(new_x, new_y)
            if not (0 <= gx < width and 0 <= gy < height):
                continue
            if costmap[gy * width + gx] > 50:
                continue

            # Classic A* cost calculations (but in continuous space)
            new_g = current_g + math.hypot(new_x-x, new_y-y)  # Actual distance
            new_h = heuristic(new_x, new_y, goal_x, goal_y)   # 2D heuristic
            new_f = new_g + new_h

            # Update if better path found
            if (new_x, new_y, new_theta) not in g_values or new_g < g_values[(new_x, new_y, new_theta)]:
                g_values[(new_x, new_y, new_theta)] = new_g
                heapq.heappush(open_list, (new_f, new_g, new_x, new_y, new_theta))
                came_from[(new_x, new_y, new_theta)] = (x, y, theta)

                # Visualization (optional)
                if viz:
                    viz.set_color(gy * width + gx, 'orange')

    return [], None