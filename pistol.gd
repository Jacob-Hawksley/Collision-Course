extends AnimatedSprite2D

@onready var bullet = preload("res://bullet.tscn")
@onready var crosshair = $Marker2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed('shoot'):
		var b = bullet.instantiate()
		get_node("/root/Main").add_child(b)
		b.transform = crosshair.transform
