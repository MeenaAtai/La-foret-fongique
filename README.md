# Tp4_La forêt fongique

## Description :
Petit projet réalisé avec **Godot 4** comprenant trois niveaux jouables, un personnage dynamique et un environnement physique interactif.  
Le jeu met en place une logique de mouvement, d’interactions et d’états du personnage dans un espace cohérent et fonctionnel. Le but de ce jeu est de ramasser les clés pour afin de déverouiller les portes. De plus, cela permet de collecter le gros cristal à la fin pour terminer le jeu. Il faut éviter rentrer en contact avec l'eau et éliminer les ennemies avec précaution.

Les éléments principaux incluent :
- L’utilisation d’un **TileMap** pour créer un environnement interactif et cohérent,
- La gestion des **entrées clavier** déclenchant mouvements, sons et animations,
- L’intégration d’un **parallax background** qui s’adapte automatiquement à la taille de la fenêtre,
- Des événements de gameplay permettant au joueur **d’éliminer les ennemis en leur sautant dessus**,
- Une **interface de menu** utilisant sprites et boutons synchronisés avec les événements du jeu,
- Une intégration de **système de vies et de morts** pour rendre le jeu plus difficile.


## Fonctionnalités :

### TileMap
- Détection des collisions entre le joueur, le TileMap et les ennemis.  
- Gestion de la physique et des collisions pour un environnement stable.  
- Création d’un niveau navigable avec plateformes, murs et limites.

### Objets interactifs & Comportements dynamiques
- Le joueur peut éliminer un ennemi en **sautant dessus**, grâce aux collisions verticales.  
- Ajout de **sons**, **effets visuels** et **particules** selon les événements (mort ennemi, saut réussi, etc.).

### Déplacements du joueur (Clavier)
- **Flèche gauche / A** : déplacement vers la gauche + animation de course (`run`).  
- **Flèche droite / D** : déplacement vers la droite + animation de course (`run`).  
- **Flèche haut / W** : saut + double saut + animation (`jump`).   

### Fond Parallax
- Image de fond ajustée automatiquement à la taille de la fenêtre.  
- Effet parallax offrant une sensation de **profondeur** et un mouvement immersif.

### Interface Menu
- Interface composée de **sprites**, **boutons** et signaux connectés aux actions du jeu.  
- Navigation simple et intuitive entre les écrans (menu, jeu, redémarrage, etc.).
- 
### Système de vie et de morts
- Interface composée de **sprites de coeur** connectés aux actions du jeu et démontrer le nombre de vies du joueur.  
- Perdre une vie lorsqu'on touche un ennemie ou/et touche l'eau.

### Accomplissement ou échec
- Affichage de "Échec" ou "Réussite"
- Démontrer réussite au jeu si le joueur peut débloquer la porte du dernier niveau en activant le lever
- Démontrer échec au jeu si le joueur perd tous ces vies ou touche à l'eau

 
 ## Crédits :
 - **joueur :**
   - https://jesshiyoo.itch.io/little-axion
 - **Ennemie :**
   - https://nastanliev.itch.io/mushrooms
 - **Audio :**
   - https://freesound.org/people/orginaljun/sounds/534347/
   - https://freesound.org/people/BloodPixelHero/sounds/584075/
   - https://sfxr.me/
   - https://soundeffectgenerator.org/fr/audio-editor?url=https%3A%2F%2Fstore.soundeffectgenerator.org%2F1c826e5b-a27d-4051-81b2-ba50833389e1.wav&name=Crystal%20cauldron%20with%20high-pitched%20magical%20bubbling%20and%20harmonic%20resonance
   - https://soundeffectgenerator.org/fr/audio-editor?url=https%3A%2F%2Fstore.soundeffectgenerator.org%2F01df28af-b777-4841-8b54-b28538338952.mp3&name=Magical%20crystal%20glowing%20and%20emitting%20a%20soft%2C%20ethereal%20hum%20with%20a%20gentle%20shimmer
   - https://freesound.org/people/rhodesmas/sounds/342756/
 - **TileMap et fond:**
   - https://theflavare.itch.io/forest-nature-fantasy-tileset
 - **Particules :**
   - https://rustybulletgames.itch.io/colored-explosions-asset-pack
 - **Font de texte :**
   - https://www.dafont.com/fr/kiwisoda.font
 - **Interface menu :**
   - https://tiopalada.itch.io/tiny-rpg-mana-soul-gui
   - https://quintino-pixels.itch.io/pixel-art-ui-elements
 - **Interface boutons :**
   - https://pixelexplosive.itch.io/free-pixel-ui-button-icon-set-21-fantasy-menu-buttons-32x32
 - **Cristal :**
   - https://frakassets.itch.io/free-dark-crystal-shrine
 - **Clé :**
   - https://frakassets.itch.io/free-rotating-key
 - **Portail :**
   - https://opengameart.org/content/portals
 - **Vies :**
   - https://redreeh.itch.io/pixelhearts-16x16
  


