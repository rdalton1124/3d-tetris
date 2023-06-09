# Controls the cameras

extends Node3D
#find the cameras
@onready var cam1 = $"back camera"
@onready var cam2 = $"side camera"

func _ready():
	cam2.set_current(true)

func _process(delta):
	if Input.is_action_just_pressed("change_cam"):
		if cam1.is_current():
			cam2.set_current(true) 
		else:
			cam1.set_current(true)
