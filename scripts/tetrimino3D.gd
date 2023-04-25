extends CharacterBody3D
@onready var root = get_parent()
@onready var spwner = $"../Spawner"
# collision variables 
var collidingLeft
var collidingRight 
var collidingTop 
var collidingBottom 

func _ready():
	print("Tetrimino ready called")
	collidingLeft = false
	collidingRight = false
	collidingTop = false 
	collidingBottom = false 
func _physics_process(delta):
	if not is_on_floor(): 
		if Input.is_action_pressed("speed_up"):
			velocity.y = -7.5
		else:
			velocity.y = -5
	else:
		velocity.y = 0 
		snap()
		root.spawn()
		set_physics_process(false)

	if Input.is_action_just_pressed("rotate-x-cw"): 
		self.rotate_x( -PI / 2)
	elif Input.is_action_just_pressed("rotate-x-ccw"): 
		self.rotate_x(PI / 2)
	
	if Input.is_action_just_pressed("rotate-y-cw"):
		self.rotate_y(- PI / 2)
	elif Input.is_action_just_pressed("rotate-y-ccw"):
		self.rotate_y(PI / 2)
	
	if Input.is_action_just_pressed("rotate-z-cw"): 
		self.rotate_z(- PI / 2)
	elif Input.is_action_just_pressed("rotate-z-ccw"): 
		self.rotate_z(PI / 2)

	if Input.is_action_just_pressed("move_forward") and not collidingTop:
		self.position.z -= 2
	elif Input.is_action_just_pressed("move_backward") and not collidingBottom:
		self.position.z += 2
	
	if Input.is_action_just_pressed("move_left") and not collidingLeft:
		self.position.x -= 2
	elif Input.is_action_just_pressed("move_right") and not collidingRight: 
		self.position.x += 2
	
	move_and_slide()
	snap()
	#reset collider booleans 
	collidingLeft = false 
	collidingRight = false
	collidingTop = false
	collidingBottom = false 
	#check for wall collisionhs. 
	for i in range(get_slide_collision_count()):
		if get_slide_collision(i).get_collider().name == "wall_left":
			print("left wall collision")
			collidingLeft = true
		elif get_slide_collision(i).get_collider().name == "wall_right":
			print("right wall collision")
			collidingRight = true
		if get_slide_collision(i).get_collider().name == "wall_top": 
			print("top wall collision")
			collidingTop = true 
		elif get_slide_collision(i).get_collider().name == "wall_bottom":
			print("bottom wall collision")
			collidingBottom = true
		
func snap(): 
	var x = int(position.x)
	var z = int(position.z)
	if not x % 2 == 0: 
		position.x -= x % 2
	
	if not z % 2 == 0: 
		position.z -= z % 2
