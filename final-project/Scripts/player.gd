extends CharacterBody2D

# Tag for checking collision
var type = "PLAYER"

# Loads player bullet scene
var player_bullet = load("res://Scenes/player_bullet.tscn")

# Gets screen size for clamp
@onready var screen_size = get_viewport_rect().size

var health = 5
var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.x = 625
	self.position.y = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Player always faces mouse
	look_at(get_global_mouse_position())
	
	# Clamps player to window
	self.position = position.clamp(Vector2.ZERO, screen_size)
	
	# On "Left Click"
	# Creates an instance of bullet scene
	# Fires bullet scene towards the mouse position
	# Spawn bullet scene,
	# at player's position
	if Input.is_action_just_pressed("Shoot"):
		var bullet = player_bullet.instantiate()
		bullet.dir = Vector2(self.position.x - get_global_mouse_position().x, self.position.y - get_global_mouse_position().y).normalized()
		get_parent().add_child(bullet)
		bullet.position = self.position
	
	if health < 1:
		print("YOU LOSE")

# Detects movememnt inputs
func get_input():
	# Checks for WASDD movement
	# Moves in inputted direction at speed
	var input_direction = Input.get_vector("Move Left", "Move Right","Move Up", "Move Down")
	velocity = input_direction * speed

# Physics calculator
func _physics_process(_delta):
	# Collects input
	# Moves player scene
	get_input()
	move_and_slide()

# Player health tracker
func advance_health_status():
	get_parent().get_node("Health Label").text = get_parent().health_status[health]
