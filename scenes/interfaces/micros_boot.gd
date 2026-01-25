extends Control

@onready var next_interface: PackedScene = preload("res://scenes/interfaces/micros_usersetup.tscn")
@onready var timer: Timer = $Timer
@onready var progress_bar: ProgressBar = $ProgressBar

var interface_noexternalboot = load("res://scenes/interfaces/noexternalboot.tscn")

var progress_speed: float = 0.1
var required_usb_name: String = "BOOTDRIVE"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not DeviceManager.check_drive(required_usb_name):
		get_tree().change_scene_to_packed(interface_noexternalboot)
	if progress_bar.value > 10:
		progress_speed = 0.03
	if progress_bar.value > 13:
		progress_speed = 0.01
	if progress_bar.value > 14:
		progress_speed = 0.03
	if progress_bar.value > 17:
		progress_speed = 0.06
	if progress_bar.value > 20:
		progress_speed = 0.06
	if progress_bar.value > 25:
		progress_speed = 0.3
	if progress_bar.value > 50:
		progress_speed = 0.01
	if progress_bar.value > 52:
		progress_speed = 0.07
	if progress_bar.value > 56:
		progress_speed = 0.01
	if progress_bar.value > 58:
		progress_speed = 1
	if progress_bar.value > 59:
		progress_speed = 0.005
	if progress_bar.value > 60:
		progress_speed = 0.1
	if progress_bar.value > 67:
		progress_speed = 0.4
	if progress_bar.value > 75:
		progress_speed = 1
	if progress_bar.value < 100:
		progress_bar.value += progress_speed
	else:
		get_tree().change_scene_to_packed(next_interface)
