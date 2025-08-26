extends CharacterBody2D
var weaponactive = false

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
func _process(delta: float) -> void:
	
	

	move_and_slide()

func newweapon(weapon):
	weaponactive = true
	var leftweapon = weapon.instantiate()
	add_child(leftweapon)
