extends Area2D

var speed = 2000
var damage = 10
var lifespan = 5
func _process(delta: float) -> void:
	lifespan -= delta
	if lifespan <= 0:
		queue_free()
func _physics_process(delta):
	position -= transform.x * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.has_method('hurt'):
		body.hurt(damage)
	else:
		queue_free()
