#!/bin/bash

if [ -z "$1" ]; then
  echo "Veuillez spécifier le monde à utiliser (par exemple, turtlebot3_world, turtlebot3_house, etc.)"
  echo "Usage: $0 <world>"
  exit 1
fi

# Lancer roscore dans un nouveau terminal
gnome-terminal -- bash -c "roscore; exec bash"

# Attendre quelques secondes pour que roscore ait le temps de démarrer
sleep 2

# Définir la variable d'environnement TURTLEBOT3_MODEL
export TURTLEBOT3_MODEL=burger

# Lancer le monde spécifié
gnome-terminal -- bash -c "roslaunch turtlebot3_gazebo $1.launch; exec bash"

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

