extends AnimatedSprite2D

@onready var anim = $"."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.frame = 0 
	anim.play ("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
