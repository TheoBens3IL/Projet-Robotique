# Projet-Robotique

## Dépendances requises
```
sudo apt-get install ros-noetic-dwa-local-planner
```

## Execution du programme

Si un workspace était déja créé :
```
cd ~/Projet-Robotique/workspace/
rm -rf build devel
catkin_make
```

**terminal 1 :**
```
cd ~/Projet-Robotique/workspace/
catkin_make
source ~/Projet-Robotique/workspace/devel/setup.bash

roslaunch ros_world salle_world.launch

```

**terminal 2 :**
```
cd ~/Projet-Robotique/workspace/
catkin_make
source ~/Projet-Robotique/workspace/devel/setup.bash

roslaunch global_path_planning turtlebot3_ros_world.launch
```

**terminal 3 :** <br>
*path_planning*
```
cd ~/Projet-Robotique/workspace/
catkin_make
source ~/Projet-Robotique/workspace/devel/setup.bash

rosrun global_path_planning path_planning_server.py
```

*motion_planning*
```
cd ~/Projet-Robotique/workspace/
catkin_make
source ~/Projet-Robotique/workspace/devel/setup.bash

rosrun global_path_planning motion_planning_server.py
```
