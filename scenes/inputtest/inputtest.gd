extends Control

@onready var label_mouse_input: Label = $VBoxContainer/LabelMouseInput
@onready var label_control_input: Label = $VBoxContainer/LabelControlInput
@onready var label_key_input: Label = $VBoxContainer/HBoxContainer/LabelKeyInput
@onready var label_usb_input_storage: Label = $VBoxContainer/LabelUSBInputSTORAGE
@onready var label_usb_input_util: Label = $VBoxContainer/LabelUSBInputUTIL
@onready var label_key_input_vol_up: Label = $VBoxContainer/HBoxContainer/LabelKeyInputVolUp
@onready var label_key_input_vol_down: Label = $VBoxContainer/HBoxContainer/LabelKeyInputVolDown

var check_drives: bool = false


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		label_mouse_input.modulate.a = 1
	else:
		label_mouse_input.modulate.a = 0.5
		
	if event is InputEventJoypadButton and event.is_pressed():
		label_control_input.modulate.a = 1
	else:
		label_control_input.modulate.a = 0.5
		
	if event is InputEventKey and event.is_pressed():
		label_key_input.modulate.a = 1
		if event.is_action_pressed("volscrolldown"): label_key_input_vol_down.modulate.a = 1.0
		else: label_key_input_vol_down.modulate.a = 0.5
	else:
		label_key_input.modulate.a = 0.5
		
	if event.is_action("volscrollup"):
		label_key_input_vol_up.modulate.a = 1.0
		#vol += 0.1
	else: label_key_input_vol_up.modulate.a = 0.5
	if event.is_action("volscrolldown"):
		label_key_input_vol_down.modulate.a = 1.0
		#vol -= 0.1
	else: label_key_input_vol_down.modulate.a = 0.5


func _process(_delta: float) -> void:
	if check_drives:
		print("checking drives")
		for index in DirAccess.get_drive_count():
			var drive_name: String = DirAccess.get_drive_name(index)
			if drive_name == "C:": continue
			
			if not FileAccess.file_exists(drive_name + "/DRIVEINFO"):
				print(drive_name + "/DRIVEINFO does not exist")
				return
			
			var drive_info: ConfigFile = ConfigFile.new()
			drive_info.load(drive_name + "/DRIVEINFO")
			
			var drive_info_name = drive_info.get_value("DriveInfo", "Name")
			if not drive_info_name: 
				print("DriveInfo value DriveInfo/Name does not exist")
				return
				
			if drive_info_name == "STORAGE16":
				label_usb_input_storage.modulate.a = 1.0
				return
				
			if drive_info_name == "UTIL03":
				label_usb_input_util.modulate.a = 1.0
				return
	
	label_usb_input_storage.modulate.a = 0.5
	label_usb_input_util.modulate.a = 0.5
