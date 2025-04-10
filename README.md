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

---
## Explications des différents algorithmes

### Dijkstra
L’algorithme de Dijkstra est une méthode de recherche de chemin optimal qui fonctionne en explorant tous les chemins possibles à partir du nœud de départ en fonction du coût cumulé.
**📌 Principe :** <br>
  - Initialise tous les nœuds avec un coût infini sauf le départ (coût 0).
  - Explore les voisins du nœud en cours en mettant à jour leur coût si un chemin plus court est trouvé.
  - Sélectionne à chaque itération le nœud avec le coût le plus faible.
  - Continue jusqu’à atteindre la cible ou avoir exploré tous les nœuds.
**✅ Avantage :** <br>
  Garantit toujours le chemin le plus court.
**❌Inconvénient :** <br>
  Explore souvent trop de nœuds, ce qui le rend lent sur de grandes cartes.

### Greedy
Cet algorithme est plus rapide que celui de Dijkstra, mais ne garantit pas toujours le chemin optimal.
**📌 Principe :** <br>
  - Utilise une distance heuristique (souvent la distance euclidienne ou de Manhattan jusqu’au point d'objectif).
  - Explore toujours en priorité le nœud qui semble le plus proche du but, sans prendre en compte le coût réel du chemin parcouru.
**✅ Avantage :** <br>
  Rapide car il se focalise directement sur la cible.
**❌ Inconvénient :** <br>
Peut ignorer de bons chemins et parfois donner un trajet sous-optimal, ou encore se prendre des obstacles. Beaucoup de hasard.

### A*
L’algorithme A* combine Dijkstra et Greedy pour obtenir un bon équilibre entre performance et optimalité.
**📌 Principe :** <br>
- Utilise une fonction de coût optimale:
  $$f(n)=g(n)+h(n)f(n) = g(n) + h(n)f(n)=g(n)+h(n)$$
 où :
  $$g(n) = \text{coût du chemin depuis le départ jusqu’à n (comme Dijkstra)}$$
 et :
  $$h(n) = \text{distance heuristique estimant le coût restant jusqu’à la cible (comme Greedy)}$$
- À chaque étape, il explore le nœud ayant la plus petite valeur de f(n).
**✅ Avantage :** <br>
  Trouve souvent le chemin optimal tout en explorant moins de nœuds que Dijkstra.
**❌ Inconvénient :** <br>
Son efficacité dépend du choix du calcul de l’heuristique.
