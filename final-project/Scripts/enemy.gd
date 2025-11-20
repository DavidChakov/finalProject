extends Node2D

# Loads bullet scene into var bullet_scene
var bullet_scene = load("res://Scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Rotates the enemy
	rotate(20)
	
	# Creates an instance of bullet
	var b = bullet_scene.instantiate()
	# Sets position relative to enemty
	b.position = self.position
	b.rotation = self.rotation
	
	# Adds instance to game
	get_parent().add_child(b)
