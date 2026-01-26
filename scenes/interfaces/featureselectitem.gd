@tool
extends PanelContainer

@export var feature_name: String = "Feature Name"
@export var feature_desc: String = "Feature Description"
@export var feature_icon: CompressedTexture2D
@export var enabled: bool = true
@export var require_recovery: bool = false

@onready var label_name: Label = $HBoxContainer/VBoxContainer/Label
@onready var label_desc: Label = $HBoxContainer/VBoxContainer/Label2
@onready var icon: TextureRect = $HBoxContainer/MarginContainer/Icon
@onready var check_box: CheckBox = $HBoxContainer/MarginContainer2/CheckBox


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#label_name.text = feature_name
	#label_desc.text = feature_desc
	#if feature_icon:
		#icon.texture = feature_icon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label_name.text = feature_name
	label_desc.text = feature_desc
	if feature_icon:
		icon.texture = feature_icon
	
	if not Engine.is_editor_hint():
		if require_recovery:
			if Game.username != "RECOVERY" and Game.password != "RECOVERY":
				enabled = false
			else:
				enabled = true
				
	if enabled:
		modulate.a = 1.0
	else:
		modulate.a = 0.5


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and enabled:
		check_box.button_pressed = !check_box.button_pressed
