# PLAYER BULLET
extends Node2D

var dir = Vector2(0,1)

@export var bullet_speed = 600

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position -= dir * delta * bullet_speed
	
	if ($RayCast2D.is_colliding()):
		var collide = $RayCast2D.get_collider().get_parent()
		if (collide.type == "ENEMY"):
			queue_free()
			print("HIT!")
			
			collide.health -= 1
			if collide.health > 0:
				print(collide.health)
		else:
			pass
	

func screen_exited() -> void:
	queue_free()


func timeout() -> void:
	pass # Replace with function body.
