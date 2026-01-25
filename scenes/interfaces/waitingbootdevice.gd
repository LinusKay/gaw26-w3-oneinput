extends Control

@onready var timer: Timer = $Timer
@onready var label: Label = $VBoxContainer/Label
@onready var label_countdown: Label = $VBoxContainer/LabelCountdown
@onready var timer_countdown: Timer = $VBoxContainer/TimerCountdown

var interface_microsboot: PackedScene = load("res://scenes/interfaces/micros_boot.tscn")
var interface_nobootdrive: PackedScene = load("res://scenes/interfaces/noexternalboot.tscn")
var required_usb_name: String = "BOOTDRIVE"

func _on_timer_timeout() -> void:
	if DeviceManager.check_drive(required_usb_name):
		get_tree().change_scene_to_packed(interface_microsboot)
	else:
		get_tree().change_scene_to_packed(interface_nobootdrive)


func _on_timer_countdown_timeout() -> void:
	label_countdown.text += str(floor(timer.time_left)) + ". . ."
