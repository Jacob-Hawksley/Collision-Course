extends AnimatedSprite2D

@onready var bullet: PackedScene = preload("res://bullet.tscn")
@onready var crosshair = $Marker2D
var hand = null
var damage = 2




func shootl():
	var b = bullet.instantiate()
	b.transform = crosshair.global_transform
	b.scale = Vector2(0.5,0.5)
	get_node("/root/Main").add_child(b)
func shootr():
	var b = bullet.instantiate()
	b.transform = crosshair.global_transform
	b.rotate(3.14159)
	b.scale = Vector2(0.5,0.5)
	get_node("/root/Main").add_child(b)
