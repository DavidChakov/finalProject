# SEEKER
extends Node2D

# Loads bullet scene into var bullet_scene
var bullet_scene = load("res://Scenes/bullet_seeker.tscn")
var shoot_timer = .4
var move_speed = 50
var health = 10
var swap_dir = 1

var type = "ENEMY"


# Links var player to player node on ready
@onready var player = get_parent().get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Enemy alwats faces towards player
	look_at(Vector2(player.position.x, player.position.y))
	
	if swap_dir % 2 != 0:
		self.position.y += move_speed * delta
	else:
		self.position.y -= move_speed * delta
		
	if health <= 0:
		queue_free()

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

func screen_entered() -> void:
	$Timer.set_wait_time(shoot_timer)
	$Timer.start()

func screen_exited() -> void:
	swap_dir += 1
