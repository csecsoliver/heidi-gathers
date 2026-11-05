extends Area2D

func _on_ready() -> void:
	self.global_position.x = randi() % 750 + 25
	self.global_position.y = randi() % 550 + 25

func _enter_tree() -> void:
	print("ENTER fear TREE")

func _ready() -> void:
	print("fear READY")
