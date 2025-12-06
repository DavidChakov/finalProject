# BULLET SEEKER
extends Node2D

var dir = Vector2(0,0)
@export var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	self.position += dir * delta * speed
	
	if ($RayCast2D.is_colliding()):
		var collide = $RayCast2D.get_collider().get_parent()
		if (collide.type == "PLAYER"):
			queue_free()
			
			collide.health -= 1
			if collide.health >= 0:
				collide.advance_health_status()



# Detects and deletes enemy once it exits the screen
func screen_exited() -> void:
	queue_free()
