extends Timer


func _ready():
	%Timer.start()

func _on_timeout() -> void:
	print("Timer stopped and you will be dead")
	pass # Replace with function body.
