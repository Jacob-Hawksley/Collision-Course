extends TextureProgressBar

func _process(delta: float) -> void:
	value = Main.hp2
	max_value = Main.maxhp2
