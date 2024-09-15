extends CharacterBody2D

const SPEED = 150;
const ACCELERATION=100;
const DECELERATION = 500;
var animation_state = null;
var sprite = null;
var direction = null
var coin_count = 0
var health = 100;
var hunger = 0;

func _ready():
	direction = Vector2.DOWN
	sprite = %Player_Sprites
	animation_state = %PlayerAnimationTree.get("parameters/playback")
	pass

func get_input() :
	var input_direction = Input.get_vector("left", "right", "up", "down")
	return input_direction
	
func _physics_process(delta: float):
	direction = get_input()
	var horizontal_dir = Input.get_axis("left", "right")
	velocity = direction * SPEED
	move_and_slide()
	
	# flip sprite if it is facing right
	if horizontal_dir !=0:
		sprite.flip_h = (horizontal_dir == 1)
	#print("the direction is: ", direction)
	if direction != Vector2.ZERO:
		%PlayerAnimationTree.set("parameters/Run/blend_position", direction)
		%PlayerAnimationTree.set("parameters/Idle/blend_position", direction)
		animation_state.travel("Run")
	else:
		#%PlayerAnimationTree.set("parameters/Idle/blend_position", direction)
		animation_state.travel("Idle")

func collect_coin():
	coin_count += 1
	%Coin.text = "Coins: %d" % coin_count

func remove_coin(cost):
	coin_count -= cost
	if (coin_count <= 0):
		coin_count =0
	%Coin.text = "Coins: %d" % coin_count

func count_coin():
	return coin_count
