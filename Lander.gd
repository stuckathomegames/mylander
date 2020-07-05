extends RigidBody2D

signal linear_velocity_reported(velocity)

var thrust = Vector2(0, -250)
var torque = 20000

func _integrate_forces(state):
	if Input.is_action_pressed("ui_up"):
		applied_force = thrust.rotated(rotation)
	else:
		applied_force = Vector2()
	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 0.1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 0.1
	applied_torque = rotation_dir * torque
	
func _physics_process(delta):
	emit_signal("linear_velocity_reported", linear_velocity)
