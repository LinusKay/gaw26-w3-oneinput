extends Control

@onready var animation_player: AnimationPlayer = $TextureRect/AnimationPlayer
@onready var progress_bar: ProgressBar = $ProgressBar


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	progress_bar.value -= 0.1
	if progress_bar.value > 99:
		print("success")


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		progress_bar.value += 10.0
