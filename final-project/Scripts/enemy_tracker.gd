extends Node2D

var bullet_scene = load("res://Scenes/bullet_default.tscn")
@onready var player = get_node("player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.set_wait_time(.2)
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass 
	
func spawn_bullet():
	var b = bullet_scene.instantiate()
	b.position = self.position
	b.dir = Vector2(player.positon.x - self.position.x, player.position.y - self.position.y).normalized()
	get_parent().add_child(b)

func timeout() -> void:
	spawn_bullet()
	print("works")
