extends CharacterBody3D
@onready var root = get_parent().get_parent()
@onready var cam = root.get_node("side camera")
@onready var spawner = get_parent()

# collision variables 
var collidingLeft
var collidingRight 
var collidingTop 
var collidingBottom 

func _ready():
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
		printPos()
		velocity.y = 0 
		snap()
		spawner.spawn()
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
		if cam.is_current():
			self.position.z -= 2
		else: 
			self.position.z += 2 
		printPos()
	elif Input.is_action_just_pressed("move_backward") and not collidingBottom:
		if cam.is_current():
			self.position.z += 2
		else: 
			self.position.z -= 2
		printPos()
	if Input.is_action_just_pressed("move_left") and not collidingLeft:
		if cam.is_current():
			self.position.x -= 2
		else:
				self.position.x += 2
		printPos()
	elif Input.is_action_just_pressed("move_right") and not collidingRight: 
		if cam.is_current():
			self.position.x += 2
		else:
			self.position.x -= 2
		printPos()
	
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
func finalSnap():
	snap()
	var y = int(position.y)
	if not y % 2 == 0: 
		position.y -= y % 2

func printPos():
	print("x = " +  str(position.x))
	print("y = " + str(global_position.y))
	print("z = " + str(position.z))
