extends KinematicBody2D

onready var input_handler = $InputHandler
var velocity = 0

export var acceleration = 50
export var deacceleration = 80
export var turning_direction_multiplier = 2.5
export var max_speed = 350
export var start_speed = 50
	
func _physics_process(delta):
	move(delta)
	print(velocity)
	
func move(delta: float):
	var direction = get_direction()
	
	if direction == 0: deaccelerate(delta)
	else: accelerate(delta, direction)
	
	move_and_slide(Vector2(0, velocity), Vector2.UP)
	
func get_direction() -> int:
	var direction = 0
	if input_handler.move_down: direction += 1
	if input_handler.move_up: direction -= 1
	
	return direction
	
func accelerate(delta: float, direction: int):
	if velocity == 0:
		velocity = start_speed * direction
		return
	
	var multiplier = 1
	if is_changing_direction(direction): multiplier = turning_direction_multiplier
	
	var next_velocity = velocity + (acceleration * direction * multiplier)
	if abs(next_velocity) > max_speed: next_velocity = max_speed * sign(velocity)
	
	velocity = next_velocity
	
func is_changing_direction(direction: int) -> bool: return sign(velocity) != direction and velocity != 0
	
func deaccelerate(delta: float):
	var next_velocity = velocity + (deacceleration * sign(velocity) * -1)
	
	if abs(next_velocity) > 0 and sign(velocity) == sign(next_velocity): velocity = next_velocity
	else: velocity = 0
