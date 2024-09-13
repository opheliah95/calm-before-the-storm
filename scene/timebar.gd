extends Line2D

signal is_stormy;

func _decrease():
	points[1].x -= 10

func _is_stormy():
	return points[1].x == 0;

func _on_timer_timeout() -> void:
	_decrease()
	if _is_stormy():
		emit_signal("is_stormy")
		 # Replace with function body.
