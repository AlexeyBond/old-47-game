extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var velocity: Vector2 = Vector2(0, -10)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("body_entered", self, "area_enter")
	self.set_rotation(Vector2(0, -1).angle_to(velocity))


func area_enter(body):
	var b = body as RigidBody2D

	if not b: return

	b.set_axis_velocity(velocity)
	var s = sign(velocity.dot(ProjectSettings.get_setting("physics/2d/default_gravity_vector")))
	
	b.set_gravity_scale(s)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


