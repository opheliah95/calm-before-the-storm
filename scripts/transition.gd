extends CanvasLayer

func _on_ready():
	%FadeScreen.visible = false

func transition():
	%FadeScreen.visible = true
	%FadeScreenAnimPlayer.play("fade_out")
	get_tree().paused = true

	  # Print to confirm the function runs
func _on_fade_screen_anim_player_animation_finished(anim_name: StringName) -> void:
	print("Animation finished")
	$FadeScreen.visible = false
	get_tree().paused = false  # Resume the game when the animation is done
	
