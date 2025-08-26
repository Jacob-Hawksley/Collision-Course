extends CharacterBody2D
var leftweaponactive = false
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
		newweapon(Main.leftweapon1)
func newweapon(weapon):
	leftweaponactive = true
	var leftweapon = weapon.instantiate()
	leftarm.add_child(leftweapon)
