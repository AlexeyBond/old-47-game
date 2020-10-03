extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$RigidBody2D.set_meta('ball', self)
	pass

func set_velocity(velocity):
	$RigidBody2D.set_axis_velocity(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
