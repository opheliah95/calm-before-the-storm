extends CharacterBody2D

const MAX_SPEED = 150;
const ACCELERATION=100;
const DECELERATION = 500;

var animationPlayer = null;
var sprite = null;
func _ready():
	animationPlayer = %PlayerAnimationPlayer
	sprite = %Player_Sprites
	pass

func get_input() :
	var input_direction = Input.get_vector("left", "right", "up", "down")
	return input_direction
	
func _physics_process(delta: float):
	var direction = get_input()
	var horizontal_dir = Input.get_axis("left", "right")
	
	# flip sprite if it is facing right
	if horizontal_dir !=0:
		sprite.flip_h = (horizontal_dir == 1)
	#print("the direction is: ", direction)
	if direction != Vector2.ZERO:
		velocity += direction * ACCELERATION 
		velocity =  velocity.normalized() * MAX_SPEED 
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)

	#print("the velocity is: ", velocity)
		
	move_and_slide()
	pass
