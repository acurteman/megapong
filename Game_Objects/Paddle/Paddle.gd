extends KinematicBody2D

var speed = 10
var lerp_var = .05
var velocity = Vector2(0,0)


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	
	# Check for user input
	var LEFT: bool = Input.is_action_pressed("ui_left")
	var RIGHT: bool = Input.is_action_pressed("ui_right")
	var UP: bool = Input.is_action_pressed("ui_up")
	var DOWN: bool = Input.is_action_pressed("ui_down")
	
	# Adjust velocity based on input
	velocity.x = lerp(velocity.x, -int(LEFT) + int(RIGHT), lerp_var)
	velocity.y = lerp(velocity.y, -int(UP) + int(DOWN), lerp_var)
	
	# Move and check for collision
	var collision = move_and_collide(velocity*speed)
	
	# If there is collision, bounce paddle away
	if collision:
		velocity = velocity.bounce(collision.normal)
