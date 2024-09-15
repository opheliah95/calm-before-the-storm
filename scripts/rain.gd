extends CPUParticles2D

var wait_time = 2.5
var damage = 1;
@onready var rain_particles = %Rain  # Reference to the rain Particle2D node
@onready var increase_rate_timer = %RainIncreaseTimer  # Timer to increase emission ra

func _ready():
	# Restart to simulate continuous emission
	increase_rate_timer.wait_time = wait_time
	increase_rate_timer.timeout.connect(_on_rain_increase_timer_timeout)
	
		
func _on_rain_increase_timer_timeout() -> void:
	%Player.take_damage(damage)
	increase_rate_timer.start()
