extends Node

var move_up = false
var move_down = false

func _process(delta):
	move_up = Input.is_action_pressed("up")
	move_down = Input.is_action_pressed("down")
