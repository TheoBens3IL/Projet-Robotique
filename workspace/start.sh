#!/bin/bash

WORKSPACE=~/Projet-Robotique/workspace

WORLDS_DIR=$WORKSPACE/src/ros_world/launch

WORLDS=($(ls $WORLDS_DIR/*.launch | sed 's/.*\///; s/\.launch$//'))

echo "Mondes disponibles: "
for i in "${!WORLDS[@]}"; do
    echo "$((i+1)). ${WORLDS[$i]}"
done

read -p "Entrer le numéro du monde à utiliser : " CHOIX

if (( CHOIX >= 1 && CHOIX <= ${#WORLDS[@]} )); then
    WORLD=${WORLDS[$((CHOIX-1))]}
    echo "Voux avez choisi : $WORLD"
else
    echo "Choix invalide"
    exit 1
fi

# Lancer roscore dans un nouveau terminal
gnome-terminal -- bash -c "roscore; exec bash"

gnome-terminal -- bash -c "cd $WORKSPACE && catkin_make && source $WORKSPACE/devel/setup.bash && roslaunch ros_world $WORLD.launch; exec bash"

gnome-terminal -- bash -c "cd $WORKSPACE && catkin_make && source $WORKSPACE/devel/setup.bash && roslaunch global_path_planning turtlebot3_ros_world.launch; exec bash"

echo "Entrez 'p' pour path planning ou 'm' pour motion planning"

while true; do
    read -n 1 input
    if [ "$input" = "p" ]; then
        gnome-terminal -- bash -c "cd $WORKSPACE && catkin_make && source $WORKSPACE/devel/setup.bash && rosrun global_path_planning path_planning_server.py; exec bash"
    elif [ "$input" = "m" ]; then
        gnome-terminal -- bash -c "cd $WORKSPACE && catkin_make && source $WORKSPACE/devel/setup.bash && rosrun global_path_planning motion_planning_server.py; exec bash"
    fi
done