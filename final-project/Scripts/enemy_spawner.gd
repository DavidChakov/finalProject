extends Node2D

@onready var enemy_seeker_scene = load("res://Scenes/enemy_seeker.tscn")
@onready var enemy_spiral_scene = load("res://Scenes/enemy_spiral.tscn")

var wave_one_time = 3
var wave_two_time = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Wave One Timer".set_wait_time(wave_one_time)
	$"Wave One Timer".start()
	
	$"Wave Two Timer".set_wait_time(wave_two_time)
	$"Wave Two Timer".start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func wave_one_timeout() -> void:
	print("WAVE ONE")
	
	var seeker = enemy_seeker_scene.instantiate()
	var spiral = enemy_spiral_scene.instantiate()
	
	randomize()
	seeker.position.x = randf_range(100,1000)
	seeker.position.y = -100
	add_child(seeker)
	
	spiral.position.x = -100
	spiral.position.y = randf_range(100,500)
	add_child(spiral)
	
	$"Wave One Timer".stop()

func wave_two_timeout() -> void:
	print("WAVE TWO")
	
	for i in range(2):
		var seeker = enemy_seeker_scene.instantiate()
		randomize()
		seeker.position.x = randf_range(100,1000)
		seeker.position.y = -100
		add_child(seeker)
	
	$"Wave Two Timer".stop()
