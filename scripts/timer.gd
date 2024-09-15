extends Timer

@onready var time_bar = %ProgressBar 
@onready var increase_rate_timer = %RainIncreaseTimer
func _ready():
	%Timer.start()
	time_bar.max_value = wait_time
	time_bar.value = wait_time
	
	# Connect the timeout signal to the function
	%Timer.timeout.connect(_on_timeout)
	
	# Start the timer
	start()

func _on_timeout() -> void:
	%Rain.show()
	%Rain.emitting = true
	increase_rate_timer.start()


func _process(delta: float) -> void:
	if time_left > 0:
		time_bar.value = get_time_left()
	else:
		time_bar.value = 0
	pass

func reset_countdown():
	stop()
	start()
	time_bar.max_value = wait_time
	time_bar.value = wait_time
