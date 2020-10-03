extends Node2D

export var velocity: Vector2 = Vector2(0, -10)

func adjust_rotation():
	self.set_rotation(Vector2(0, -1).angle_to(velocity))

func _ready():
	$Area2D.connect("body_entered", self, "area_enter")
	adjust_rotation()

func area_enter(body):
	var b = body as RigidBody2D

	if not b: return

	b.set_axis_velocity(velocity)
	var s = sign(velocity.dot(ProjectSettings.get_setting("physics/2d/default_gravity_vector")))
	
	b.set_gravity_scale(s)


func _on_clicker_clicked():
	velocity = velocity.rotated(PI * 0.25)
	adjust_rotation()
	# TODO: Sound ??
