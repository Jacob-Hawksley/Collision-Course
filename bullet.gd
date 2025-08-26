extends Area2D

var speed = 2000

func _physics_process(delta):
	position -= transform.x * speed * delta
