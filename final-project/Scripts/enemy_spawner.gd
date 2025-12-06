extends Node2D

@onready var enemy_seeker_scene = load("res://Scenes/enemy_seeker.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Wave One Timer".set_wait_time(5)
	$"Wave One Timer".start()
	
	$"Wave Two Timer".set_wait_time(10)
	$"Wave Two Timer".start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func wave_one_timeout() -> void:
	print("WAVE ONE")
	
	var enemy = enemy_seeker_scene.instantiate()
	randomize()
	enemy.position.x = randf_range(100,1000)
	enemy.position.y = -100
	add_child(enemy)
	
	$"Wave One Timer".stop()

func wave_two_timeout() -> void:
	print("WAVE TWO")
	
	for i in range(2):
		var enemy = enemy_seeker_scene.instantiate()
		randomize()
		enemy.position.x = randf_range(100,1000)
		enemy.position.y = -100
		add_child(enemy)
	
	$"Wave Two Timer".stop()
