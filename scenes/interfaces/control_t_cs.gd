extends Control

@onready var check_box: CheckBox = $VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/CheckBox
@onready var button_ok: Button = $VBoxContainer/HBoxContainer/ButtonOK
@onready var button_back: Button = $VBoxContainer/HBoxContainer/ButtonBack

@onready var control_user_creds: Control = $"../ControlUserCreds"
@onready var control_features: Control = $"../ControlFeatures"


func _on_button_pressed() -> void:
	hide()
	control_features.show()


func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		button_ok.disabled = false
	else:
		button_ok.disabled = true


func _on_button_back_pressed() -> void:
	hide()
	control_user_creds.show()
