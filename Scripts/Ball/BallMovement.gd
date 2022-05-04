extends KinematicBody2D

var direction = Vector2(0,0)
var speed = 50
var extra_speed = 0

func _ready():
	set_random_direction()

func _physics_process(delta):
	move(delta)

func move(delta: float):
	var move_result = move_and_collide(direction * (speed + extra_speed) * delta)
	check_for_collisions(move_result)
	
func check_for_collisions(move_result: KinematicCollision2D):
	if move_result:
		bounce(move_result.normal)
	
func bounce(normal: Vector2):
	direction = direction.bounce(normal)
	
func set_random_direction():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	direction = Vector2(rng.randf_range(-1,1), rng.randf_range(-1,1)).normalized()
