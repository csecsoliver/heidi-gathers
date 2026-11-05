extends StaticBody2D

func _on_ready() -> void:
	self.global_rotation = ((0.5*PI*randi_range(0,1)))
	self.global_position.x = randi() % 750 + 25
	self.global_position.y = randi() % 550 + 25

func _enter_tree() -> void:
	print("ENTER wall TREE")

func _ready() -> void:
	print("wall READY")
