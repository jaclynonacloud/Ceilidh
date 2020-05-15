extends KinematicBody2D

export var move_speed:float = 15.0

var last_position:Vector2 = Vector2.ZERO
var desired_position:Vector2 = Vector2.ZERO

func _ready():
	last_position = self.global_transform.origin

func _process(delta):
	var horizontal:float = -1 if Input.is_action_pressed("ui_left") else 1 if Input.is_action_pressed("ui_right") else 0
	var vertical:float = -1 if Input.is_action_pressed("ui_up") else 1 if Input.is_action_pressed("ui_down") else 0
	var movement = Vector2(horizontal, vertical).normalized()
	
	move_and_slide(movement * Ceilidh.GRID_SIZE * move_speed)
