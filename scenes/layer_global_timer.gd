extends CanvasLayer

@onready var label_timer_global: Label = $LabelTimerGlobal
@onready var timer_global: Timer = $TimerGlobal


func _process(_delta: float) -> void:
	label_timer_global.text = str(snapped(timer_global.time_left, 0.01))
