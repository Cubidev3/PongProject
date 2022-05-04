extends Node2D

onready var top_border: StaticBody2D = $Top
onready var bottom_border: StaticBody2D = $Bottom
onready var left_border: StaticBody2D = $Left
onready var right_border: StaticBody2D = $Right

export var map_height = 256
export var map_width = 455

var border_extents = 10

func _ready():
	set_borders_positions()
	set_borders_extents()
	enable_all_collisions()

func set_borders_positions():
	top_border.position.y = -((map_height/2) + border_extents)
	top_border.position.x = 0
	
	bottom_border.position.y = (map_height/2) + border_extents
	bottom_border.position.x = 0
	
	left_border.position.x = -((map_width/2) + border_extents)
	left_border.position.y = 0
	
	right_border.position.x = (map_width/2) + border_extents
	right_border.position.y = 0
	
func set_borders_extents():
	set_horizontal_border_extents(top_border)
	set_horizontal_border_extents(bottom_border)
	set_vertical_border_extents(left_border)
	set_vertical_border_extents(right_border)
	
func set_horizontal_border_extents(border: StaticBody2D):
	var shape = RectangleShape2D.new()
	shape.extents.y = border_extents
	shape.extents.x = map_width/2
	
	get_collision_shape(border).shape = shape
	
func set_vertical_border_extents(border: StaticBody2D):
	var shape = RectangleShape2D.new()
	shape.extents.x = border_extents
	shape.extents.y = map_height/2
	
	get_collision_shape(border).shape = shape
	
func get_collision_shape(border: StaticBody2D) -> CollisionShape2D:
	return border.get_node("CollisionShape2D") as CollisionShape2D
	
func enable_all_collisions():
	enable_collision(top_border)
	enable_collision(bottom_border)
	enable_collision(left_border)
	enable_collision(right_border)

func enable_collision(border: StaticBody2D):
	var collision = get_collision_shape(border)
	collision.disabled = false

