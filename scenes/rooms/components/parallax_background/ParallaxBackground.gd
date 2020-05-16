extends ParallaxBackground

export var auto_x_speed:float = 15.0
export var auto_y_speed:float = 15.0

onready var p_layer:ParallaxLayer = $ParallaxLayer
onready var bg:Sprite = $ParallaxLayer/BG

var background_size:Vector2 = Vector2.ZERO
var current_offset:Vector2 = Vector2.ZERO

func _ready():
	background_size = bg.texture.get_size()
	
	
func _process(delta):
	current_offset.x = lerp(current_offset.x, clamp(0, current_offset.x + auto_x_speed * delta, background_size.x), 0.5)
	current_offset.y = lerp(current_offset.y, clamp(0, current_offset.y + auto_y_speed * delta, background_size.y), 0.5)
	
	p_layer.motion_offset = current_offset
	print(offset)
