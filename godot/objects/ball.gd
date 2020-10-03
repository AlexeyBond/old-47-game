extends Node2D

func _ready():
	$RigidBody2D.set_meta('ball', self)
	pass

func set_velocity(velocity):
	$RigidBody2D.set_axis_velocity(velocity)

func _physics_process(delta):
	var v: Vector2 = $RigidBody2D.linear_velocity
	var l = v.length()
	
	if (l < 0.01):
		v = Vector2(100, 0).rotated(rand_range(0, PI * 2.0))
		$RigidBody2D/CPUParticles2D.emitting = true
		$RigidBody2D/CPUParticles2D.restart()
	
	$RigidBody2D.set_axis_velocity(v)
