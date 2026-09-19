extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -250.0
var OppositeGravity:bool = false
var tpzone: Sprite2D
var move:bool = true
@onready var camera:Camera2D = $Camera2D

func _ready() -> void:
	Global.camera = $Camera2D
func _physics_process(delta: float) -> void:
	up_direction = Vector2(0, 1 if OppositeGravity else -1)
	camera.zoom = Vector2(1, -1 if OppositeGravity else 1) * 3
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta  * (-1 if OppositeGravity else 1)

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY  * (-1 if OppositeGravity else 1)
	if Input.is_action_just_pressed("interact") and is_on_floor() and tpzone:
		tpzone.tp(self)
		move = false
		tpzone = null

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction and move:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
