extends CharacterBody2D
var leftweaponactive = false
var rightweaponactive = false
@onready var leftarm: RigidBody2D = $LArm
@onready var rightarm: RigidBody2D = $RArm
@onready var LArmPin = $"LArm-Torso"
@onready var RArmPin = $"RArm-Torso"
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var leftweapon = null
var rightweapon = null



func _process(delta: float) -> void:
	if not leftweaponactive:
		newleftweapon(Main.leftweapon2)
	if not rightweaponactive:
		newrightweapon(Main.rightweapon2)
	if Input.is_action_just_pressed("2shoot"):
		leftweapon.shootl('2')
	if Input.is_action_just_pressed("2shootr"):
		rightweapon.shootr('2')
func _physics_process(delta: float) -> void:
	leftarm.rotation = (Input.get_vector("2left","2right","2up","2down").angle() + 3.14159)
	rightarm.rotation = (Input.get_vector("2left","2right","2up","2down").angle())
	velocity += Main.recoil2
	Main.recoil2 = Vector2.ZERO
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()
func newleftweapon(weapon):
	leftweaponactive = true
	leftweapon = weapon.instantiate()
	leftarm.add_child(leftweapon)
	leftweapon.position.x -= 100
func newrightweapon(weapon):
	rightweaponactive = true
	rightweapon = weapon.instantiate()
	rightarm.add_child(rightweapon)
	rightweapon.flip_h = false
	rightweapon.position.x += 100
