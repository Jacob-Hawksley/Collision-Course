extends Area2D

var speed = 4000
var lifespan = 0.1
func _physics_process(delta):
	position -= transform.x * speed * delta
	lifespan -= delta
	if lifespan <= 0:
		queue_free()
