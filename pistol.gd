extends AnimatedSprite2D

@onready var bullet: PackedScene = preload("res://bullet.tscn")
@onready var crosshair = $Marker2D
var hand = null
var damage = 2
var knockback_force = 150.0
var shootcd = 0
func _process(delta: float) -> void:
	if shootcd > 0:
		shootcd -= delta


func shootl():
	if shootcd <= 0:
		shootcd = 0.3
		var b = bullet.instantiate()
		b.transform = crosshair.global_transform
		b.scale = Vector2(0.5,0.5)
		get_node("/root/Main").add_child(b)#
		var knockbackdirection = b.transform.x
		Main.recoil += knockbackdirection * knockback_force
func shootr():
	if shootcd <= 0:
		shootcd = 0.3
		var b = bullet.instantiate()
		b.transform = crosshair.global_transform
		b.rotate(3.14159)
		b.scale = Vector2(0.5,0.5)
		get_node("/root/Main").add_child(b)
		var knockbackdirection = b.transform.x
		Main.recoil += knockbackdirection * knockback_force
