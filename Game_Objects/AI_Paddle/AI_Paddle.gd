extends KinematicBody2D

export var speed = 10
export var lerp_var = .01
var velocity = Vector2(0,0)
var target = Vector2(0,0)
var target_accuracy = 10
var mov_dir = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	target = get_parent().get_node("Ball").position
	
	# Check position of the ball, and set mov_dir accordingly
	if target.y < position.y + target_accuracy:
		mov_dir = -1
	elif target.y > position.y + target_accuracy:
		mov_dir = 1
	else:
		mov_dir = 0
	
	# Gradually change velocity
	velocity.y = lerp(velocity.y, mov_dir, lerp_var)
	
	# Move paddle and check for collisions
	var collision_info = move_and_collide(velocity*speed)
	
	# If there has been a collision, bounce paddle away
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
