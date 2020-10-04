extends Node2D

export var velocity: Vector2 = Vector2(0, -100)

export var checkpoints_path: NodePath = "../checkpoints"

func adjust_rotation():
	self.set_rotation(Vector2(0, -1).angle_to(velocity))

func _ready():
	$Area2D.connect("body_entered", self, "area_enter")
	adjust_rotation()

func area_enter(body):
	var b = body as RigidBody2D

	if not b: return

	var d = velocity.dot(Vector2(0, 1))
	var s = sign(d)
	if abs(d) < 0.1: s = 0
	
	yield(get_tree(), "idle_frame")

	b.set_gravity_scale(s)
	b.apply_central_impulse(-b.linear_velocity * b.mass)
	b.apply_central_impulse(velocity * b.mass)


func _on_clicker_clicked():
	velocity = velocity.rotated(PI * 0.25)
	adjust_rotation()
	var manager = get_node(checkpoints_path)
	if manager: manager.on_player_action()
	# TODO: Sound ??
