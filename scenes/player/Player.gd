extends KinematicBody2D

export var move_speed:float = 15.0

onready var trigger:Area = $Trigger

var last_position:Vector2 = Vector2.ZERO
var desired_position:Vector2 = Vector2.ZERO

func _ready():
	last_position = self.global_transform.origin
	
	# listen to signals
	trigger.connect("body_entered", self, "_on_body_entered")
	trigger.connect("body_exited", self, "_on_body_exited")
	trigger.connect("area_entered", self, "_on_area_entered")
	trigger.connect("area_exited", self, "_on_area_exited")

func _process(delta):
	var horizontal:float = -1 if Input.is_action_pressed("ui_left") else 1 if Input.is_action_pressed("ui_right") else 0
	var vertical:float = -1 if Input.is_action_pressed("ui_up") else 1 if Input.is_action_pressed("ui_down") else 0
	var movement = Vector2(horizontal, vertical).normalized()
	
	move_and_slide(movement * Ceilidh.GRID_SIZE * move_speed)

func _on_body_entered(body:Node):
	Ceilidh.emit_signal("collision_entered", self, body)
	
func _on_body_exited(body:Node):
	Ceilidh.emit_signal("collision_exited", self, body)

func _on_area_entered(body:Node):
	Ceilidh.emit_signal("area_entered", self, body)
	
func _on_area_exited(body:Node):
	Ceilidh.emit_signal("area_exited", self, body)
	Ceilidh.emit_signal("area_exited", self, body)
