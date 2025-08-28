extends AnimatedSprite2D

@onready var bullet: PackedScene = preload("res://shell.tscn"	)
@onready var crosshair = $Marker2D
var hand = null
var damage = 2
var knockback_force = 100.0
var shootcd = 0

func _process(delta: float) -> void:
	if shootcd > 0:
		shootcd -= delta

func shootl():
	if shootcd <= 0:
		shootcd = 1
		for i in range(8):
			var b = bullet.instantiate()
			b.transform = crosshair.global_transform
			b.scale = Vector2(1.5,1.5)
			b.rotate(randf_range(-0.5, 0.5))
			get_node("/root/Main").add_child(b)#
			var knockbackdirection = b.transform.x
			Main.recoil += knockbackdirection * knockback_force
func shootr():
	if shootcd <= 0:
		shootcd = 1
		for i in range(8):
			var b = bullet.instantiate()
			b.transform = crosshair.global_transform
			b.rotate(3.14159 + randf_range(-0.5,0.5))
			b.scale = Vector2(1.5,1.5)
			get_node("/root/Main").add_child(b)
			var knockbackdirection = b.transform.x
			Main.recoil += knockbackdirection * knockback_force
