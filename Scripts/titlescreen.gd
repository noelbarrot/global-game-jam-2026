extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Quit"):
		get_tree().quit()


func _on_timer_timeout() -> void:
	var new_scene = load("res://Scenes/office_level.tscn")
	get_tree().change_scene_to_packed(new_scene)
