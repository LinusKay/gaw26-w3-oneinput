extends Node


func check_drive(drive_name: String) -> bool:
	var found: bool = false
	for index in DirAccess.get_drive_count():
		var index_drive_name: String = DirAccess.get_drive_name(index)
		
		if index_drive_name == "C:": continue
		
		if not FileAccess.file_exists(index_drive_name + "/DRIVEINFO"):
			continue
		
		var drive_info: ConfigFile = ConfigFile.new()
		drive_info.load(index_drive_name + "/DRIVEINFO")
		
		var drive_info_name = drive_info.get_value("DriveInfo", "Name")
		
		if not drive_info_name: 
			continue
			
		if drive_info_name == drive_name:
			found = true
			break
			
	return found
