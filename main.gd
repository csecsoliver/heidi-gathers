extends Node2D

var timer = Timer.new()

func _on_ready() -> void:
	seed(int(Time.get_unix_time_from_system()*10))
	var wall = preload("res://wall.tscn")
	for i in range(5):
		var wall_node = wall.instantiate()
		self.add_child(wall_node)
	
	var fear = preload("res://fear.tscn")
	for i in range(10):
		var fear_node = fear.instantiate()
		self.add_child(fear_node)

func _enter_tree() -> void:
	print("MAIN ENTER TREE")

func _ready() -> void:
	print("MAIN READY")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
