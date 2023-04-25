#responsible for spawning new pieces 
#when the previous block has landed. 
#works by choosing random number and 
#spawning the corresponding tetriminoes. 

extends Node3D
#rng
@onready var rng = RandomNumberGenerator.new()
#preload tetriminoes. 
const tets = [preload("res://tetriminos3D/tetrimino1.tscn"), preload("res://tetriminos3D/tetrimino2.tscn"), preload("res://tetriminos3D/tetrimino3.tscn"), 
preload("res://tetriminos3D/tetrimino4.tscn"), preload("res://tetriminos3D/tetrimino5.tscn"), preload("res://tetriminos3D/tetrimino6.tscn"), 
preload("res://tetriminos3D/tetrimino7.tscn"), preload("res://tetriminos3D/tetrimino8.tscn")]

func _ready(): 
	rng.randomize()#randomize
	spawn()#spawn the first tetrimino. 
func spawn(): 
	#choose a random number
	var num = rng.randi_range(0, 7)
	#spawn the corresponding block 
	var newBlock = tets[num].instantiate()
	
	add_child(newBlock)

