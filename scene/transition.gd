extends CanvasLayer

func _on_ready():
	%FadeScreen.visible = false
	%FadeScreenAnimPlayer.animation_finished.connect(_on_animation_finished)

func transition():
	%FadeScreen.visible = true
	%FadeScreenAnimPlayer.play("fade_out")

func _on_animation_finished():
	%FadeScreen.visible = false
	
