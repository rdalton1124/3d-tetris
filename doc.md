﻿# 3D Tetris 
## Purpose of the game 
	- It is like a regular Tetris game, but in 3D. 
	- Instead of having to fill a line, you have to clear a 5x5 box. 
	- Falling tetriminoes can be rotated 90 degrees on all 3 axes. 
## Cameras
	- Top Camera: always shown as a subviewport. A camera looking straight down at the playfield. 
	- Side camera: The main camera. Looking at the field from a 45% angle. 
	- Back camera: Opposite of side camera, so that player can see other side of the playfield. Can be changed 
	using V. 
## Controls 
### Rotations 
	- I/K: 
	- J/L:
	- U/O:
### Movements
	- When looking through the back cameras, the controls are all reversed, so that the movement keys will do the opposite of their normal movement, so that the block will move somewhere that makes sense from the perspective you're looking at it. 
	- W: Move forward. When looking through the side cameras it will move the block toward the top right wall. When looking through the top camera, it moves the block toward the top wall. 
	- D: Move backwards. When looking through a side camera, it moves toward the bottom left wall. When looking through the top camera, it moves towards the bottom wall 
	- A: Move left. When looking through a side wall, it will move towards the back left wall. When looking through the top camera, it will move towards the left wall
	- D: Move right. When looking through a side camera, it will move towards the front/right wall. When looking through the top camera, it will move toward the right wall 
	- Shift: Fall faster. Since D is being used as a movement key, it is now left Shift. The block will fall 1.5x faster 
	- Space: Quick drop. Block falls to the bottom. It is accomplished by momentarily setting the downward velocity to an extremely high value. 
### Other 
	- V: change camera. Changes between the side camera and the back camera. 
## Scenes 
### Tetriminoes 1-8
	- The tetrimino blocks which fall and need to lined up 
	- Like with Pentris, all tetriminoes share a script. 
	- They use cylinder shapes for collision. This is to prevent the 
	- The reflections (S block/Z block and L block/J block) only have one tetrimino as they can 
	be created by rotating around the Y axis. 
	- 
## Scripts 
### Tetrimino3D
#### _physics_process() 
	- 
#### Other Functions 
 	- _ready: sets the colliding booleans to false 
	- printPos: prints position. Used for debugging 
	- 
#### Variables 
	- cam: Reference to side camera. Used to check active camera, and adjust controls as needed 
	- root: reference to root. Only used to make finding other nodes easier 
	- spawner: reference to spawener. Spawn is called when block hits floor 
	- landed: Reference to landed, a node which is used to deal with blocks which have landed 
	- the collding booleans. Top, bottom, left and right. Set to true when colliding with the relevant wall. Prevents user from moving in the direction when it is colldiing. 
### Spawner
	- In charge of spawning new tetriminoes. Works by choosing a random number and then spawning the corresponding tetrimino. 
#### Variables 
	- rng: A random number generator 
	- tetriminoes: an array of preloaded tetriminoes. 
	- num: random number 0-7 genereted by rng. That index of tetriminoes will be instantiated. 
#### Functions
	- _ready(): Initializs RNG and calls spawn for the first time. 
	- Spawn(): picks a number and spawns the block. Called when a block hits the ground. 
### Root 
	- Really only in charge of changing the cameras 
#### Variables 
	- cam1 reference to back camera 
	- cam2 reference to side camera
#### Functions 
	- _ready: sets side camera as main camera 
	- _process: If V is pressed, change active camera. 
### clear 
