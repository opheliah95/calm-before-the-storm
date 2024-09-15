extends Area2D

var cost = 5
var days = 0;
var warning_timer: Timer

func _ready():
	# Hide the warning label at the start
	$WarningLabel.visible = false
	# Create a Timer node to handle the warning label's visibility
	warning_timer = Timer.new()
	warning_timer.wait_time = 1.0  # 1 second
	warning_timer.one_shot = true
	add_child(warning_timer)
	warning_timer.timeout.connect(_on_warning_timeout)
	
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "Player"):
		if (%Player.count_coin() < cost):
			print("not enough coin")
			%WarningLabel.visible = true
			warning_timer.start()
		else :
			body.remove_coin(cost)
			days += 1
			%Day.text = "Days: %d" %days


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
	# Hide the warning label when the player leaves the area
		$WarningLabel.visible = false
		# Stop the timer if the player leaves before the timer finishes
		warning_timer.stop()

func _on_warning_timeout():
	# Hide the warning label after 1 second
	$WarningLabel.visible = false
