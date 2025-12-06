@tool
extends Node2D

# Collision type
# Size of portal
# Portal color
# Time to win
var type = "PORTAL"
var radius = 100.0
var color = Color.YELLOW
var countdown = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Color transparency
	color.a = 0.25
	
	# Sets collision shape size to radius
	$Area2D/CollisionShape2D.shape.radius = radius
	
	self.position = Vector2(-200,-200)
	
	$"Spawn Timer".set_wait_time(30)
	$"Spawn Timer".start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func body_entered(_body: Node2D) -> void:
	print("ENTER")
	$"Win Timer".set_wait_time(countdown)
	$"Win Timer".start()

func body_exited(_body: Node2D) -> void:
	print("EXIT")
	$"Win Timer".stop()

func _draw():
	draw_circle(Vector2(0,0), radius, color)

func spawn_timeout() -> void:
	# Randomly spawns portal
	randomize()
	self.position = Vector2(randf_range(110,1000),randf_range(100,550))

func win_timeout() -> void:
	print("YOU WIN!")
