extends CharacterBody2D

const MAX_SPEED = 150;
const ACCELERATION=100;
const DECELERATION = 500;

var animationPlayer = null;

func _ready():
	animationPlayer = $PlayerAnimationPlayer
	pass

func get_input() :
	var input_direction = Input.get_vector("left", "right", "up", "down")
	return input_direction
	
func _physics_process(delta: float):
	var direction = get_input()
	#print("the direction is: ", direction)
	if direction != Vector2.ZERO:
		velocity += direction * ACCELERATION 
		velocity =  velocity.normalized() * MAX_SPEED 
		%Player_Idle.visible = false
		%Player_Run_Front.visible = true
		%PlayerAnimationPlayer.play("run-front")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)
		%Player_Idle.visible = true
		%Player_Run_Front.visible = false
		%PlayerAnimationPlayer.play("idle-front")
	#print("the velocity is: ", velocity)
		
	move_and_slide()
	pass
