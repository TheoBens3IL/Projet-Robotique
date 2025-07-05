# **Projet-Robotique**

## **Dépendances requises**
```
sudo apt-get install ros-noetic-dwa-local-planner
```

## **Execution du programme**

Si un workspace était déja créé :
```
cd ~/Projet-Robotique/workspace/
rm -rf build devel
catkin_make
```

Pour lancer le programme, executer simplement le script start.sh :
```
./start.sh
```
et choisir le monde sur lequel lancer la simulation. <br>
Puis, une fois tous les terminal lancés, choisisr (sur le premier terminal) 'p' pour 'path_planning' ou 'm' pour 'motion_planning'. <br>
<br>

Pour une explication plus détaillée de l'execution, voir ci-dessous :

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

___

<br>

# **RAPPORT DE PROJET**
**11/04/2025**

Ben Sadoun Théo |
Potin Lea |
Riotte Florian

## **VUE D'ENSEMBLE**
Ce projet vise à explorer les principes fondamentaux de la navigation autonome à l’aide de ROS (Robot Operating System) et de la plateforme TurtleBot3. L’objectif principal est de modéliser un environnement réaliste, de générer une carte grâce au SLAM, d’analyser différents algorithmes de navigation, et de valider les performances du système à travers une tâche de Motion Planning avec contraintes dynamiques.

## **OBJECTIFS**
1. Modéliser un environnement simulé (salle de classe avec obstacles) sous **Gazebo**.
2. Construire une carte **SLAM** à partir de la simulation.
3. Comparer les performances de plusieurs algorithmes de navigation : **Dijkstra**, **Greedy**, **A\***.
4. Implémenter la navigation autonome sur carte connue et évaluer les résultats.
5. Intégrer une tâche de **Motion Planning** prenant en compte les contraintes dynamiques
du robot.

## **OUTILS ET CARACTÉRISTIQUES**
- **Logiciels :** ROS1, Gazebo, RViz, gmapping.
- **Matériel :** TurtleBot3 Burger (simulé).
- **Langages :** Python (scripts), XML (URDF), YAML (configurations).
- **Algorithmes :**
    - Path Planning : Dijkstra, Greedy, A*.
    - Motion Planning : A* dynamique (tentative).

## **GRANDES ÉTAPES**

### **Étape 1 : Simulation dans Gazebo d’un lieu réel avec obstacles**
La première grande étape de notre projet était donc de simuler un environnement réel ainsi que les obstacles spécifiques à cet endroit. Pour cela nous avons choisi de simuler la salle de classe, ainsi que certaines chaises et bureaux. <br>
Pour simuler cette salle, nous avons utilisé Gazebo :
● Building Editor : Création des murs, portes et fenêtres avec des textures et des couleurs adaptées.
● Model Editor : Ajout de modèles 3D (bureaux, chaises) depuis la bibliothèque Gazebo.
Le fichier `.world` généré a été intégré à un fichier `.launch` de lancement ROS pour y inclure le TurtleBot et lancer la carte dans gazebo.

**Problème rencontré :** Difficulté à faire apparaître le robot dans l’environnement. <br>
**Solution :** Modification du fichier `.launch` pour charger le modèle du TurtleBot3 avec les bons chemins URDF.

![image](https://github.com/user-attachments/assets/d3114ce3-f100-42da-85c4-bcbce95407e5)

___

### **Étape 2 : Construction de Carte SLAM avec TurtleBot**
Le robot a été déplacé manuellement à l’aide d’un script de téléopération basé sur turtlebot3_teleop. Le capteur LIDAR a permis de construire une carte via gmapping. <br>
**Problème rencontré :** cartographie incomplète ou floue. <br>
**Solution :** Réduction de la vitesse du robot pour une meilleure précision du LIDAR

![image](https://github.com/user-attachments/assets/5609b2fa-283d-45c1-9e34-8fdc61fd4830)

---
### **Étape 3 : Analyse des différents algorithmes de navigation**

#### **Dijkstra**
L’algorithme de Dijkstra est une méthode de recherche de chemin optimal qui fonctionne en explorant tous les chemins possibles à partir du nœud de départ en fonction du coût cumulé. <br>

**📌 Principe :** <br>
  - Initialise tous les nœuds avec un coût infini sauf le départ (coût 0).
  - Explore les voisins du nœud en cours en mettant à jour leur coût si un chemin plus court est trouvé.
  - Sélectionne à chaque itération le nœud avec le coût le plus faible.
  - Continue jusqu’à atteindre la cible ou avoir exploré tous les nœuds. <br>

![image](https://github.com/user-attachments/assets/39f18b82-4fa0-40e7-946d-5501071e0980)

**✅ Avantage :** <br>
  - Garantit toujours le chemin le plus court. <br>

**❌Inconvénient :** <br>
  - Explore souvent trop de nœuds, ce qui le rend lent sur de grandes cartes.
<br>

#### **Greedy**
Cet algorithme est plus rapide que celui de Dijkstra, mais ne garantit pas toujours le chemin optimal. <br>

**📌 Principe :** <br>
  - Utilise une distance heuristique (souvent la distance euclidienne ou de Manhattan jusqu’au point d'objectif).
  - Explore toujours en priorité le nœud qui semble le plus proche du but, sans prendre en compte le coût réel du chemin parcouru. <br>

![image](https://github.com/user-attachments/assets/85a86d39-a284-4f2d-b7e7-79e290415997)

**✅ Avantage :** <br>
  - Rapide car il se focalise directement sur la cible. <br>

**❌ Inconvénient :** <br>
  - Peut ignorer de bons chemins et parfois donner un trajet sous-optimal, ou encore se prendre des obstacles. Beaucoup de hasard.
<br>

#### **A\***
L’algorithme A* combine Dijkstra et Greedy pour obtenir un bon équilibre entre performance et optimalité. <br>

**📌 Principe :** <br>
- Utilise une fonction de coût optimale: <br>
  $$f(n)=g(n)+h(n)f(n) = g(n) + h(n)f(n)=g(n)+h(n)$$ <br>
 où :
    $$g(n) = \text{coût du chemin depuis le départ jusqu’à n (comme Dijkstra)}$$ <br>
 et :
    $$h(n) = \text{distance heuristique estimant le coût restant jusqu’à la cible (comme Greedy)}$$ <br>
- À chaque étape, il explore le nœud ayant la plus petite valeur de f(n). <br>

![image](https://github.com/user-attachments/assets/dfba66f4-ca6a-4fd3-9f83-0a4735441273)

**✅ Avantage :** <br>
  - Trouve souvent le chemin optimal tout en explorant moins de nœuds que Dijkstra. <br>

**❌ Inconvénient :** <br>
  - Son efficacité dépend du choix du calcul de l’heuristique. <br>

___
### **Étape 4 : Navigation autonome d’une carte connue avec TurtleBot**
La carte préalablement sauvegardée a été chargée avec `map_server`. Les objectifs de navigation étaient envoyés via Rviz (2D Nav Goal). <br>
**Observations :**
- L’algorithme A* s’est montré le plus performant dans les environnements denses (ex : entre les chaises).
- Temps de latence de 2-3 secondes après évitement d’obstacle pour recalculer la trajectoire.

___
### **Étape 5 : Implémentation d’une tâche de Motion Planning (Planification de Mouvement)**
Cette étape visait à mettre en œuvre une planification de mouvement prenant en compte les contraintes physiques du robot : cinématique, dynamique, vitesses et accélérations maximales. <br>
L’objectif était de permettre un déplacement plus fluide, réaliste et sécurisé, en particulier dans des environnements complexes ou restreints.

Nous avons tenté d’implémenter un algorithme de planification dynamique basé sur A* (A* Dynamic), intégrant des paramètres de vitesse et d’accélération. Cependant, cette partie n’a pas pu être testée correctement dans RViz à cause d’un problème technique survenu lors du lancement du nœud de planification.

**Problème rencontré :** Une erreur s’est produite lors du chargement du planificateur dans RViz, probablement liée à un conflit de dépendances ROS ou à une mauvaise configuration dans le fichier `.yaml` du `move_base`. Malgré plusieurs tentatives (recompilation, vérification des fichiers de configuration), l’erreur persistait. <br>
**Résultat :** Le module de Motion Planning n’a pas pu être validé en simulation, bien que l’implémentation ait été amorcée.

___
### **Comparaison des résultats**

|                                     | Dijkstra                                   | Greedy                                     | A*                                         |
| ----------------------------------- | ------------------------------------------ | ------------------------------------------ | ------------------------------------------ |
| Temps d'exécution (en s)            | 79.80                                      | 8.07                                       | 7.38                                       |
| Nombre de noeud<br>parcourus        | 16                                         | 17                                         | 18                                         |
| Longueur de chemin<br>trouvé (en m) | 0.80                                       | 0.85                                       | 0.90                                       |
| Résultat du chemin                  | ![image](https://github.com/user-attachments/assets/39f18b82-4fa0-40e7-946d-5501071e0980) | ![image](https://github.com/user-attachments/assets/85a86d39-a284-4f2d-b7e7-79e290415997) | ![image](https://github.com/user-attachments/assets/dfba66f4-ca6a-4fd3-9f83-0a4735441273) |

___
## **Conclusion**
Ce projet nous a permis de comprendre en profondeur la navigation autonome sur ROS, de la modélisation d’un environnement à l’exécution de trajectoires complexes en tenant compte des contraintes dynamiques du robot. <br>
Nous avons exploré les limites des algorithmes classiques et tenté d’intégrer des techniques avancées comme le Motion Planning dynamique. Même si cette dernière partie n’a pas pu être testée avec succès par manque de temps, elle a posé les bases pour une future extension du projet.

___
## **Perspective**
- Résoudre les erreurs liées au lancement du planificateur pour tester le Motion Planning dynamique.
- Réaliser des tests sur un robot réel avec des capteurs physiques.
- Évaluer la robustesse des algorithmes dans des environnements non-déterministes.
