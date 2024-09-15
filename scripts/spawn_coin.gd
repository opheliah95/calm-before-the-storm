extends Node2D
var random = null;
var coin_count = 50
@onready var coin_path =%CoinPath
@onready var container = Node2D.new()

func _ready():
	container.name="Coin_Holder"
	add_child(container)
	random = RandomNumberGenerator.new()
	random.randomize()
	for i in coin_count:
		spawn_coin(i)
	
func spawn_coin(number):
	print("spawn coin: ", number)
	var coin = preload("res://scene/coin.tscn").instantiate()
	coin_path.progress_ratio = randf()
	coin_path.h_offset = random.randf_range(-500.0,300.0)
	coin_path.v_offset = random.randf_range(-500.0,300.0)
	coin.global_position = coin_path.global_position
	container.add_child(coin)
	
