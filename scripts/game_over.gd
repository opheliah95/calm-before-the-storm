extends CanvasLayer

func _ready():
	self.hide()

func _on_button_pressed() -> void:
	print("restart level")
	self.hide()
	get_tree().paused = false
	get_tree().reload_current_scene()
	

func game_over():
	self.show()
	get_tree().paused = true
