extends CharacterBody2D
var timer = 0.0;
var run_timer = true;
var leaf_count = 0;
func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()
	
	
func pick_up_leaf(area):
	area.queue_free();
	$ItemInHand.visible = true;
	
func deposit_leaf(area):
	$ItemInHand.visible = false;
	leaf_count += 1;
	$CanvasLayer/LeafCountDisplay.text = "Fears: " + str(leaf_count)
	if leaf_count >= 10:
		run_timer = false

func _process(delta: float) -> void:
	if run_timer:
		timer += delta
		$CanvasLayer/Timer.text = str(roundf(timer*100)/100)
		
	for i in $HeidiCollectionArea.get_overlapping_areas():
		if i.is_in_group("leaf") and not $ItemInHand.visible:
			pick_up_leaf(i)
		if i.is_in_group("basket") and $ItemInHand.visible:
			deposit_leaf(i)
	
