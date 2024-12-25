extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -300.0

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "ridht")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0 :
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0 :
			anim.play("Idle")

	if direction == -1 :
		$AnimatedSprite2D.flip_h = true
	elif direction == 1 :
		$AnimatedSprite2D.flip_h = false
	if velocity.y > 0:
		anim.play("Fall")
		
	move_and_slide()
