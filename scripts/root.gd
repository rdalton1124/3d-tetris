extends Node3D
@onready var cam1 = $"top camera"
@onready var cam2 = $"side camera"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("change_cam"): 
		if cam1.is_current(): 
			cam2.set_current(true)
		else:
			cam1.set_current(true)
