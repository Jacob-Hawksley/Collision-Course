extends CharacterBody2D
var leftweaponactive = false
var rightweaponactive = false
@onready var leftarm = $LArm
@onready var rightarm = $RArm
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

func _process(delta: float) -> void:
	if not leftweaponactive:
		newleftweapon(Main.leftweapon1)
	if not rightweaponactive:
		newrightweapon(Main.rightweapon1)
	
func newleftweapon(weapon):
	leftweaponactive = true
	var leftweapon = weapon.instantiate()
	leftarm.add_child(leftweapon)
	leftweapon.left()
func newrightweapon(weapon):
	rightweaponactive = true
	var rightweapon = weapon.instantiate()
	rightarm.add_child(rightweapon)
	rightweapon.flip_h = false
	rightweapon.right()
