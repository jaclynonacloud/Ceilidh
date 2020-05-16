extends Node

const GRID_SIZE:Vector2 = Vector2(32, 32)

signal area_entered(caller, callee)
signal area_exited(caller, callee)
signal collision_entered(caller, callee)
signal collision_exited(caller, callee)


func _ready():
	connect("area_entered", self, "_on_trigger_entered", ["area"])
	connect("area_exited", self, "_on_trigger_exited", ["area"])
	connect("collision_entered", self, "_on_trigger_entered", ["collision"])
	connect("collision_exited", self, "_on_trigger_exited", ["collision"])
	
	
func _on_trigger_entered(caller:Node, callee:Node, type:String):
	var is_player:bool = caller.is_in_group("player")
	match type:
		"area":
			if is_player:
				print("Player is calling: %s" % callee.name)
		"collision":
			if is_player:
				print("Player is calling: %s collision" % callee.name)
	
func _on_trigger_exited(caller:Node, callee:Node, type:String):
	pass
