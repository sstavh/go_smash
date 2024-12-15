extends ParallaxBackground

var speedBg =  100

func _process(deltal):
	scroll_offset.x -= speedBg * deltal;
