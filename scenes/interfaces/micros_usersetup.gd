extends Control

@onready var line_edit_username: LineEdit = $ControlUserCreds/VBoxContainer/LineEditUsername
@onready var line_edit_password: LineEdit = $ControlUserCreds/VBoxContainer/LineEditPassword
@onready var button: Button = $ControlUserCreds/Button
@onready var control_t_cs: Control = $ControlTCs

func _process(_delta: float) -> void:
	if line_edit_username.text.length() > 0 and line_edit_password.text.length() > 0:
		button.disabled = false
	else:
		button.disabled = true

#
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("enter"):
		#if line_edit_username.text.length() > 0 and line_edit_password.text.length() > 0:
			#_save_user()


func _on_button_pressed() -> void:
	_save_user()
	control_t_cs.show()


func _save_user() -> void:
	print("save user")
	Game.username = line_edit_username.text
	Game.password = line_edit_password.text
