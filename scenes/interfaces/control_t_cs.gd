extends Control

@onready var check_box: CheckBox = $VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/CheckBox
@onready var button: Button = $VBoxContainer/Button



func _on_button_pressed() -> void:
	print("t&c ok")


func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		button.disabled = false
	else:
		button.disabled = true
