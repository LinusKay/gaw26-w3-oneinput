extends Control

@onready var label_countdown: Label = $VBoxContainer/LabelCountdown
@onready var timer: Timer = $VBoxContainer/LabelCountdown/Timer

var interface_microsboot: PackedScene = load("res://scenes/interfaces/micros_boot.tscn")
var interface_microssetup: PackedScene = load("res://scenes/interfaces/micros_usersetup.tscn")
var interface_cortonboot: PackedScene = load("res://scenes/interfaces/corton_boot.tscn")


func _process(_delta: float) -> void:
	label_countdown.text = str(ceil(timer.time_left))


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("F1"):
		get_tree().change_scene_to_packed(interface_microsboot)
	if event.is_action_pressed("F2"):
		get_tree().change_scene_to_packed(interface_microssetup)


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(interface_cortonboot)
