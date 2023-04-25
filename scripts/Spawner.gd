extends Node3D
@onready var rng = RandomNumberGenerator.new()
const tets = [preload("res://tetriminos3D/tetrimino1.tscn"), preload("res://tetriminos3D/tetrimino2.tscn"), preload("res://tetriminos3D/tetrimino3.tscn"), 
preload("res://tetriminos3D/tetrimino4.tscn"), preload("res://tetriminos3D/tetrimino5.tscn"), preload("res://tetriminos3D/tetrimino6.tscn"), 
preload("res://tetriminos3D/tetrimino7.tscn"), preload("res://tetriminos3D/tetrimino8.tscn")]

func _ready(): 
	rng.randomize()
	spawn()
func spawn(): 
	print("Spawn called")
	var num = rng.randi_range(0, 7)
	var newBlock = tets[num].instantiate()
	add_child(newBlock)

