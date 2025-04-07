#!/bin/bash

WORLDS_DIR=~/Documents/Projet-Robotique/path_planning_ws/src/ros_world/worlds

WORLDS=($(ls $WORLDS_DIR/*.world | sed 's/.*\///; s/\.world$//'))

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
    exit1
fi

# Lancer roscore dans un nouveau terminal
gnome-terminal -- bash -c "roscore; exec bash"

# Attendre quelques secondes pour que roscore ait le temps de démarrer
sleep 2

# Définir la variable d'environnement TURTLEBOT3_MODEL
export TURTLEBOT3_MODEL=turtlebot3

# Lancer le monde spécifié
gnome-terminal -- bash -c "roslaunch turtlebot3_gazebo turtlebot3_world.launch world_name:=$WORLD; exec bash"

sleep 8

# Lancer turtlebot3_slam.launch avec gmapping dans un autre terminal
gnome-terminal -- bash -c "roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping; exec bash"

sleep 8

# Lancer turtlebot3_teleop_key.launch dans un autre terminal
gnome-terminal -- bash -c "roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch; exec bash"

echo "Appuyez sur 's' pour sauvegarder la carte, 'q' pour quitter"
while true; do
  read -n 1 input
  if [ "$input" = "s" ]; then
    rosrun map_server map_saver -f ~/ma_carte
    echo "Carte sauvegardée sous ~/ma_carte"
  elif [ "$input" = "q" ]; then
    break
  fi
done

