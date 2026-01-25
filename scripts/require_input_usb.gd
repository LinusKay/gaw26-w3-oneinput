extends RequireInput

@export var required_usb_name: String = "STORAGE16"
@onready var label: Label = $Label
var poll_usb: bool = false

func _ready() -> void:
	super()
	label.text = "Input USB: " + required_usb_name

func start() -> void:
	super()
	poll_usb = true

func next() -> void:
	super()
	poll_usb = false

func _process(_delta: float) -> void:
	if poll_usb:
		if DeviceManager.check_drive(required_usb_name):
			print("success")
			success()
		#for index in DirAccess.get_drive_count():
			#var drive_name: String = DirAccess.get_drive_name(index)
			#print(drive_name)
			#if drive_name == "C:": continue
			#
			#if not FileAccess.file_exists(drive_name + "/DRIVEINFO"):
				#continue
			#
			#var drive_info: ConfigFile = ConfigFile.new()
			#drive_info.load(drive_name + "/DRIVEINFO")
			#
			#var drive_info_name = drive_info.get_value("DriveInfo", "Name")
			#
			#if not drive_info_name: 
				#continue
				#
			#if drive_info_name == required_usb_name:
				#print("success")
				#success()
				#return
