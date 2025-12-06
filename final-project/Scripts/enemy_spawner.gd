extends Node2D

@onready var enemy_seeker_scene = load("res://Scenes/enemy_seeker.tscn")

var spawn_timer = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.set_wait_time(spawn_timer)
	$Timer.start()
	var enemy = enemy_seeker_scene.instantiate()
	
	randomize()
	enemy.position.x = randf_range(100,1000)
	enemy.position.y = -100
	add_child(enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func timeout() -> void:
	var enemy = enemy_seeker_scene.instantiate()
	randomize()
	enemy.position.x = randf_range(100,1000)
	enemy.position.y = -100
	add_child(enemy)
