extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Moves bullet based off rotation
	# Vector (XY movement) rotates based off rotation
	self.position += Vector2(1, 0).rotated(self.rotation)
	
	if ($RayCast2D.is_colliding()):
		print("Hit")
