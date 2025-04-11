#!/usr/bin/env python3

import rospy
import time
from pp_msgs.srv import PathPlanningPlugin, PathPlanningPluginResponse
from geometry_msgs.msg import Twist
from gridviz import GridViz
from algorithms.dijkstra import dijkstra
from algorithms.astar import astar
from algorithms.greedy import greedy
from algorithms.q_learning import q_learning
from algorithms.lpastar import lpastar

previous_plan_variables = None

def make_plan(req):
    global previous_plan_variables

    costmap = req.costmap_ros
    width = req.width
    height = req.height
    start_index = req.start
    goal_index = req.goal
    resolution = 0.05
    origin = [-10, -10, 0]

    viz = GridViz(costmap, resolution, origin, start_index, goal_index, width)

    # Récupérer l'algorithme depuis les paramètres ROS
    algorithm_name = rospy.get_param('~algorithm', 'astar')
    
    # Mapper le nom de l'algorithme à la fonction correspondante
    algorithms = {
        'dijkstra': dijkstra,
        'astar': astar,
        'greedy': greedy,
        'lpastar': lpastar
    }

    # Obtenir la fonction de l'algorithme
    algorithm = algorithms.get(algorithm_name, astar)  # Par défaut A* si non trouvé

    rospy.loginfo("Planification de trajectoire en cours avec l'algorithme : %s", algorithm.__name__)
    
    # Mesure du temps d'exécution
    start_time = time.time()
    path, previous_plan_variables = algorithm(
        start_index, goal_index, width, height, costmap, resolution, origin, viz, previous_plan_variables
    )
    execution_time = time.time() - start_time

    if not path:
        rospy.logwarn("Aucun chemin trouvé par l'algorithme sélectionné.")
        path = []
    else:
        rospy.loginfo("++++++++ Résultats de la planification ++++++++")
        rospy.loginfo("Algorithme utilisé : %s", algorithm.__name__)
        rospy.loginfo("Temps total d'exécution : %.4f secondes", execution_time)
        rospy.loginfo("Nombre de noeud parcourus: %d", len(path))
        rospy.loginfo("Longueur du chemin trouvé : %.2f mètres", len(path) * resolution)
        rospy.loginfo("++++++++++++++++++++++++++++++++++++++++++++")
        
        # Enregistrement des résultats dans un fichier
        with open("performance_log.txt", "a") as log_file:
            log_file.write(f"Algorithme : {algorithm.__name__}\n")
            log_file.write(f"Temps d'exécution : {execution_time:.4f} secondes\n")
            log_file.write(f"Longueur du chemin : {len(path)} cases ({len(path) * resolution:.2f} mètres)\n")
            log_file.write("-------------------------------------\n")
    
    rospy.loginfo("Envoi du chemin au système de navigation.")
    
    resp = PathPlanningPluginResponse()
    resp.plan = path
    return resp

def clean_shutdown():
    rospy.loginfo("Arrêt du service, envoi d'une commande d'arrêt au robot.")
    cmd_vel.publish(Twist())
    rospy.sleep(1)

if __name__ == '__main__':
    rospy.init_node('path_planning_service_server', log_level=rospy.INFO, anonymous=False)
    rospy.loginfo("Service de planification de trajectoire lancé.")
    
    make_plan_service = rospy.Service("/move_base/SrvClientPlugin/make_plan", PathPlanningPlugin, make_plan)
    cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)
    rospy.on_shutdown(clean_shutdown)
    
    while not rospy.core.is_shutdown():
        rospy.rostime.wallsleep(0.5)
    
    rospy.loginfo("Fermeture du service.")
    rospy.Timer(rospy.Duration(2), rospy.signal_shutdown('Arrêt en cours...'), oneshot=True)
