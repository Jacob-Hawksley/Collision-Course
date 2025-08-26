extends AnimatedSprite2D

@onready var bullet: PackedScene = preload("res://bullet.tscn")
@onready var crosshair = $Marker2D
var hand = null

func _process(delta: float) -> void:
	if hand == 'left':
		if Input.is_action_just_pressed('shoot'):
			var b = bullet.instantiate()
			b.transform = crosshair.global_transform
			b.scale = Vector2(0.5,0.5)
			get_node("/root/Main").add_child(b)
	elif hand == 'right':
		if Input.is_action_just_pressed('shootr'):
			var b = bullet.instantiate()
			b.transform = crosshair.global_transform
			b.rotate(3.14159)
			b.scale = Vector2(0.5,0.5)
			get_node("/root/Main").add_child(b)
func left():
	hand = 'left'
func right():
	hand = 'right'
