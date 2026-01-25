extends Control

@onready var line_edit_username: LineEdit = $ColorRect/VBoxContainer/LineEditUsername
@onready var line_edit_password: LineEdit = $ColorRect/VBoxContainer/LineEditPassword
@onready var button: Button = $ColorRect/Button


func _process(_delta: float) -> void:
	if line_edit_username.text.length() > 0 and line_edit_password.text.length() > 0:
		button.disabled = false
	else:
		button.disabled = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("enter"):
		if line_edit_username.text.length() > 0 and line_edit_password.text.length() > 0:
			_save_user()


func _on_button_pressed() -> void:
	_save_user()


func _save_user() -> void:
	print("save yuser")
	Game.username = line_edit_username.text
	Game.password = line_edit_password.text
