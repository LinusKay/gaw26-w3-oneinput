extends Control

@onready var button_back: Button = $VBoxContainer/HBoxContainer/ButtonBack
@onready var button_ok: Button = $VBoxContainer/HBoxContainer/ButtonOK
@onready var control_t_cs: Control = $"../ControlTCs"



func _on_button_back_pressed() -> void:
	hide()
	control_t_cs.show()


func _on_button_ok_pressed() -> void:
	print("features ok")
