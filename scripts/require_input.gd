class_name RequireInput extends Control

@onready var timer: Timer = $Timer
@export var next_require_input: Control


func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)


func start() -> void:
	show()
	timer.start()
	
	
func success() -> void:
	print("success")
	timer.stop()
	next()


func fail() -> void:
	timer.stop()
	print("fail")
	next()


func _on_timer_timeout() -> void:
	fail()


func next() -> void:
	hide()
	next_require_input.start()
	
