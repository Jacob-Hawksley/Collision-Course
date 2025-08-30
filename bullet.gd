extends Area2D

var speed = 2000
var damage = 10
func _physics_process(delta):
	position -= transform.x * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.has_method('hurt'):
		body.hurt(damage)
