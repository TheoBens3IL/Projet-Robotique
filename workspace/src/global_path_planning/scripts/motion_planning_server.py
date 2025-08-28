#!/usr/bin/env python3

import rospy
import time
from pp_msgs.srv import MotionPlanningPlugin, MotionPlanningPluginResponse
from geometry_msgs.msg import Twist
from gridviz import GridViz
from algorithms import astar_dwa  # Import de votre nouvel algorithme

previous_plan_variables = None

def make_motion_plan(req):
    global previous_plan_variables

    costmap = req.costmap_ros
    width = req.width
    height = req.height
    start_index = req.start
    goal_index = req.goal
    resolution = req.resolution
    origin = req.origin  # [x,y,z]

    viz = GridViz(costmap, resolution, origin, start_index, goal_index, width)

    # Récupérer l'algorithme depuis les paramètres ROS
    algorithm_name = rospy.get_param('~algorithm', 'astar_dwa')
    
    # Pour l'instant seul A* + DWA est disponible
    algorithm = astar_dwa
    
    rospy.loginfo("Motion Planning en cours avec l'algorithme : %s", algorithm.__name__)
    
    # Mesure des performances
    start_time = time.time()
    path, previous_plan_variables = algorithm(
        start_index, goal_index, width, height, costmap, resolution, origin, viz, previous_plan_variables
    )
    execution_time = time.time() - start_time

    if not path:
        rospy.logwarn("Aucun chemin trouvé par l'algorithme sélectionné.")
        path = []
    else:
        rospy.loginfo("++++++++ Résultats du Motion Planning ++++++++")
        rospy.loginfo("Algorithme utilisé : %s", algorithm.__name__)
        rospy.loginfo("Temps d'exécution : %.4f secondes", execution_time)
        rospy.loginfo("Nombre de waypoints : %d", len(path))
        rospy.loginfo("Longueur estimée : %.2f mètres", len(path) * resolution)
        rospy.loginfo("+++++++++++++++++++++++++++++++++++++++++++++")
        
        # Log des performances
        with open("motion_performance_log.txt", "a") as log_file:
            log_file.write(f"Algorithme : {algorithm.__name__}\n")
            log_file.write(f"Temps : {execution_time:.4f} s\n")
            log_file.write(f"Waypoints : {len(path)}\n")
            log_file.write("-------------------------------------\n")
    
    resp = MotionPlanningPluginResponse()
    resp.plan = path
    return resp

def clean_shutdown():
    rospy.loginfo("Arrêt du service, commande d'arrêt envoyée.")
    cmd_vel.publish(Twist())
    rospy.sleep(1)

if __name__ == '__main__':
    rospy.init_node('motion_planning_service_server', log_level=rospy.INFO)
    
    # Service (remplacez le nom si nécessaire)
    service = rospy.Service(
        "/move_base/SrvClientPlugin/make_motion_plan", 
        MotionPlanningPlugin, 
        make_motion_plan
    )
    
    cmd_vel = rospy.Publisher('/cmd_vel', Twist, queue_size=5)
    rospy.on_shutdown(clean_shutdown)
    
    rospy.loginfo("Service de Motion Planning (A* + DWA) prêt.")
    rospy.spin()