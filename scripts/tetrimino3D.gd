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
			velocity.y = - .75
		else:
			velocity.y = -.5
	else:
		velocity.y = 0 
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
		self.position.z -= .4
	elif Input.is_action_just_pressed("move_backward") and not collidingBottom:
		self.position.z += .4
	if Input.is_action_just_pressed("move_left") and not collidingLeft:
		self.position.x -= .4
	elif Input.is_action_just_pressed("move_right") and not collidingRight: 
		self.position.x += .4
	move_and_slide()
	collidingLeft = false 
	collidingRight = false
	collidingTop = false
	collidingBottom = false 
	for i in range(get_slide_collision_count()):
		if get_slide_collision(i).get_collider().name == "wall_left":
			collidingLeft = true
		elif get_slide_collision(i).get_collider().name == "wall_right":
			collidingRight = true
		if get_slide_collision(i).get_collider().name == "wall_top": 
			collidingTop = true 
		elif get_slide_collision(i).get_collider().name == "wall_bottom":
			collidingBottom = true
		
	
