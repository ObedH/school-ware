class_name PlayerPlatformer
extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300
const GRAVITY = 1200
const FALL_MULT = 1.2
const STOP_MULT = 2.0

var is_falling: bool = false
var input_locked: bool = true
var jb: bool = false

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var jb_timer: Timer = $JBTimer
@onready var jump_sfx: AudioStreamPlayer = $JumpSFX


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if velocity.y > 0:
			velocity += Vector2.DOWN * GRAVITY * FALL_MULT * delta
		else:
			if not is_falling:
				velocity += Vector2.DOWN * GRAVITY * delta
			else:
				velocity += Vector2.DOWN * GRAVITY * STOP_MULT * delta
	else:
		is_falling = false

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		jb = true
		jb_timer.start()
	
	if jb and is_on_floor() and not input_locked:
		velocity.y = JUMP_VELOCITY
		jump_sfx.play()
		jb = false
	
	if Input.is_action_just_released("jump") and not input_locked:
		is_falling = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction and not input_locked:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false

	move_and_slide()


func _on_jb_timer_timeout() -> void:
	jb = false
