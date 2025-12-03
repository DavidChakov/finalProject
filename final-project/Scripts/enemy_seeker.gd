# SEEKER
extends Node2D

# Loads bullet scene into var bullet_scene
var bullet_scene = load("res://Scenes/bullet_seeker.tscn")
var shoot_timer = .4

# Links var player to player node on ready
@onready var player = get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Calls timeout() function every X seconds
	$Timer.set_wait_time(shoot_timer)
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Enemy alwats faces towards player
	look_at(Vector2(player.position.x, player.position.y))

# Spawns bullets
func spawn_bullets():
		# Creates a scene of the bullet
		# Positions bullet at the center of the enemy
		# Tranforms bullet towards player
		var bullet = bullet_scene.instantiate()
		bullet.position = self.position
		bullet.dir = Vector2(player.position.x - self.position.x, player.position.y - self.position.y).normalized()
		
		get_parent().add_child(bullet)

func timeout() -> void:
	spawn_bullets()
