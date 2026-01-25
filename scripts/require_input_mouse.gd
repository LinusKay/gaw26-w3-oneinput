extends RequireInput

@onready var button: Button = $Button

func _ready() -> void:
	super()
	start()

func _on_button_pressed() -> void:
	success()
