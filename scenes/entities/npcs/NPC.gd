extends StaticBody2D
class_name NPC

const DISTANCE_MARGIN:float = 0.14

export var readable:String = ""
export var navigation_path:NodePath

export var move_extents:float = 10.0
export var move_speed:float = 0.5

var navigation:Navigation2D

var nav_path:PoolVector2Array

func _ready():
	navigation = get_node_or_null(navigation_path)
	next()
	
	
func _process(delta):
	if nav_path.size() > 0:
		move_toward_next()
		
		if global_position.distance_to(nav_path[0]) < DISTANCE_MARGIN:
			next()

func next():
	var offset = Vector2(rand_range(-move_extents, move_extents), rand_range(-move_extents, move_extents))
	
	nav_path = navigation.get_simple_path(global_position, global_position + offset, true)
	nav_path.remove(0)

func move_toward_next():
	
	if nav_path.size() > 0:
		var direction = global_position.direction_to(nav_path[0])
		var distance = global_position.distance_to(nav_path[0])
		global_position += direction * min(move_speed, distance)
