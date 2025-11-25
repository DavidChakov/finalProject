extends Node2D

# Loads bullet scene into var bullet_scene
var bullet_scene = load("res://Scenes/bullet_default.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Calls timeout() function every X seconds
	$Timer.set_wait_time(.2)
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Rotates the enemy
	rotate(1 * delta)
	
	# Moves the enemy
	self.position.x += .2

# Spawns bullets
func spawn_bullets():
	# Arrays of bullet names and vectors
	# Counter used to iterate through arrays
	var bullets = ["b1","b2","b3","b4"]
	var directions = [Vector2(1,0),Vector2(0,1),Vector2(-1,0),Vector2(0,-1)]
	var counter = 0
	
	for bullet in bullets:
		# Creates an instance of the bullet scene
		# Sets position relative to enemty
		# Rotates relative to enemy
		# Moves in a direction (up, down, left, or right) decided by direction array
		bullet = bullet_scene.instantiate()
		bullet.position = self.position
		bullet.rotation = self.rotation
		bullet.dir = directions[counter]
		
		# Adds instance to game
		# Iterates through list
		get_parent().add_child(bullet)
		counter += 1

func timeout() -> void:
	spawn_bullets()
