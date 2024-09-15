extends Button
@onready var restart_button = %Button
func _ready():
	self.hide()
	restart_button.pressed.connect("_on_button_pressed")  # Connect the signal to the function
