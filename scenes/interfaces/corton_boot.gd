extends Control

var interface_waitingboot: PackedScene = load("res://scenes/interfaces/waitingbootdevice.tscn")
var interface_noexternalboot = load("res://scenes/interfaces/noexternalboot.tscn")

@onready var timer: Timer = $Control/Timer
@onready var timer_reload: Timer = $TimerReload
@onready var control: Control = $Control


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("boot_menu"):
		get_tree().change_scene_to_packed(interface_waitingboot)


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(interface_noexternalboot)
	#control.hide()
	#timer_reload.start()
	#get_tree().change_scene_to_packed(interface_cortonboot)


#func _on_timer_reload_timeout() -> void:
	#control.show()
	#get_tree().change_scene_to_packed(interface_cortonboot)
