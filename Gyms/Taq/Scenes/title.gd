extends Node2D

var randomWaitTime:float
@onready var timer:Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomWaitTime = randf_range(0, 6.0)
	timer.wait_time = randomWaitTime
	timer.start()
	timer.timeout.connect(_onTimerTimeout)

func _onTimerTimeout():
	$Flashback.swapFlashbackImage()
	randomWaitTime = randf_range(0, 6.0)
	timer.wait_time = randomWaitTime
	print("random wait time", randomWaitTime)
	print("timer ", timer.wait_time)
	timer.start()


	
