extends Area2D

var speed = 4000
var lifespan = 0.1
var damage = 3
func _physics_process(delta):
	position -= transform.x * speed * delta
	lifespan -= delta
	if lifespan <= 0:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method('hurt'):
		body.hurt(damage)
