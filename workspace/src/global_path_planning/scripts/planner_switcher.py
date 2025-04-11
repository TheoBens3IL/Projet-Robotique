#!/usr/bin/env python
import rospy
from std_msgs.msg import String

def switcher():
    rospy.init_node('planner_switcher')
    
    # Récupère l'algorithme depuis les paramètres ROS (défaut: astar)
    algorithm = rospy.get_param('~algorithm', 'astar')
    
    # Publie l'algorithme sélectionné sur le topic /planner_algorithm
    pub = rospy.Publisher('/planner_algorithm', String, queue_size=10, latch=True)
    pub.publish(algorithm)
    
    rospy.loginfo(f"Planner switcher initialisé avec l'algorithme: {algorithm}")
    rospy.spin()  # Garde le nœud actif

if __name__ == '__main__':
    try:
        switcher()
    except rospy.ROSInterruptException:
        pass