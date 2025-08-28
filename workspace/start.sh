#!/bin/bash

WORKSPACE=~/Projet-Robotique/workspace
WORLDS_DIR=$WORKSPACE/src/ros_world/launch
WORLDS=($(ls $WORLDS_DIR/*.launch | sed 's/.*\///; s/\.launch$//'))

choose_world() {
    echo "Mondes disponibles:"
    for i in "${!WORLDS[@]}"; do
        echo "$((i+1)). ${WORLDS[$i]}"
    done
    read -p "Entrez le numéro du monde: " CHOIX
    
    if (( CHOIX >= 1 && CHOIX <= ${#WORLDS[@]} )); then
        WORLD=${WORLDS[$((CHOIX-1))]}
        echo "Monde sélectionné: $WORLD"
    else
        echo "Choix invalide"
        exit 1
    fi
}

choose_algorithm() {
    echo "Algorithmes disponibles:"
    echo "1. Dijkstra"
    echo "2. A*"
    echo "3. Greedy"
    echo "4. A* + DWA (Motion Planning)"
    read -p "Entrez le numéro de l'algorithme: " ALGO_CHOICE
    
    case $ALGO_CHOICE in
        1) ALGORITHM="dijkstra"; PLANNING_TYPE="path" ;;
        2) ALGORITHM="astar"; PLANNING_TYPE="path" ;;
        3) ALGORITHM="greedy"; PLANNING_TYPE="path" ;;
        4) ALGORITHM="astar_dwa"; PLANNING_TYPE="motion" ;;
        *) echo "Choix invalide"; exit 1 ;;
    esac
    
    echo "Algorithme sélectionné: $ALGORITHM"
}

main() {
    # Arrêt des processus ROS existants
    killall -9 roscore rosmaster 2>/dev/null
    
    choose_world
    choose_algorithm
    
    # Terminal 1: Monde Gazebo
    gnome-terminal --tab --title="Monde $WORLD" -- bash -c "
        cd $WORKSPACE
        source devel/setup.bash
        roslaunch ros_world $WORLD.launch
        exec bash"
    
    # Attendre que Gazebo soit lancé
    sleep 5
    
    # Terminal 2: Planification
    gnome-terminal --tab --title="Planification $ALGORITHM" -- bash -c "
        cd $WORKSPACE
        source devel/setup.bash
        roslaunch global_path_planning turtlebot3_ros_world.launch \
            planning_type:=$PLANNING_TYPE \
            algorithm:=$ALGORITHM
        exec bash"
    
    echo "-------------------------------------"
    echo "Configuration lancée avec succès:"
    echo "- Monde: $WORLD"
    echo "- Algorithme: $ALGORITHM"
    echo "- Type: $PLANNING_TYPE"
    echo "-------------------------------------"
}

main