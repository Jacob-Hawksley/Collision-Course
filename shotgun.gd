extends AnimatedSprite2D

@onready var bullet: PackedScene = preload("res://shell.tscn"	)
@onready var crosshair = $Marker2D
@onready var magazine = $TextureProgressBar
var hand = null
var damage = 2
var knockback_force = 100.0
var shootcd = 0
var maxammo = 4
var ammo = 4

func _process(delta: float) -> void:
	if shootcd > 0:
		shootcd -= delta
	magazine.value = ammo
	magazine.max_value = maxammo
	if shootcd <= 0 and ammo <= 4:
		ammo += delta

func shootl():
	if shootcd <= 0 and ammo >= 1:
		shootcd = 1
		ammo -= 1
		for i in range(8):
			var b = bullet.instantiate()
			b.transform = crosshair.global_transform
			b.scale = Vector2(1.5,1.5)
			b.rotate(randf_range(-0.5, 0.5))
			get_node("/root/Main").add_child(b)#
			var knockbackdirection = b.transform.x
			Main.recoil += knockbackdirection * knockback_force
func shootr():
	if shootcd <= 0 and ammo >= 1:
		shootcd = 1
		ammo -= 1
		for i in range(8):
			var b = bullet.instantiate()
			b.transform = crosshair.global_transform
			b.rotate(3.14159 + randf_range(-0.5,0.5))
			b.scale = Vector2(1.5,1.5)
			get_node("/root/Main").add_child(b)
			var knockbackdirection = b.transform.x
			Main.recoil += knockbackdirection * knockback_force
