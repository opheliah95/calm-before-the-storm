extends CharacterBody2D

const SPEED = 150;
const ACCELERATION=100;
const DECELERATION = 500;
var animation_state = null;
var sprite = null;
func _ready():
	sprite = %Player_Sprites
	animation_state = %PlayerAnimationTree.get("parameters/playback")
	pass

func get_input() :
	var input_direction = Input.get_vector("left", "right", "up", "down")
	return input_direction
	
func _physics_process(delta: float):
	var direction = get_input()
	var horizontal_dir = Input.get_axis("left", "right")
	velocity = direction * SPEED
	move_and_slide()
	
	# flip sprite if it is facing right
	if horizontal_dir !=0:
		sprite.flip_h = (horizontal_dir == 1)
	print("the direction is: ", direction)
	if velocity.length() > 0:
		%PlayerAnimationTree.set("parameters/Run/blend_position", direction)
		animation_state.travel("Run")
	else:
		%PlayerAnimationTree.set("parameters/Idle/blend_position", direction)
		animation_state.travel("Idle")

	#print("the velocity is: ", velocity)
		
	
	pass
