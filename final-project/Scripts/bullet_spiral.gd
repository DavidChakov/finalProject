# BULLET SPIRAL
extends Node2D

var dir = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	# Moves bullet based off rotation
	# Vector (XY movement) rotates based off rotation
	self.position += dir.rotated(self.rotation)
	
	if ($RayCast2D.is_colliding()):
		print("Hit Spiral")

func screen_exited() -> void:
	queue_free()
