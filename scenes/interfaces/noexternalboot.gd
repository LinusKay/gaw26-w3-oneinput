extends Control

@onready var interface_cortonboot: PackedScene = load("res://scenes/interfaces/corton_boot.tscn")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(interface_cortonboot)
