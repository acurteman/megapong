extends KinematicBody2D

export var speed = 50
var velocity = Vector2(.25,.1)


func _ready():
	# Set ball position to position of BallSpawn
	position = get_parent().get_node("BallSpawn").position

# If ball hits backboard, this function is called to reset the ball back to center
# then wait 3 seconds to release it
func reset(time):
	$reset_timer.wait_time = time
	set_physics_process(false)
	$reset_timer.start()
	get_parent().get_node("HUD").countDown(3)
	position = get_parent().get_node("BallSpawn").position

# Reenable physics after reset countdown, so ball continues moving
func _on_reset_timer_timeout():
	set_physics_process(true)

func _physics_process(delta):
	
	# Move ball and check for collisions
	var collision = move_and_collide(velocity*speed)
	
	if collision:
		# Check what the ball hit to either change direction accordingly, or reset and add to score
		var coll_obj = collision.collider
		if coll_obj in get_tree().get_nodes_in_group("wall"):
			velocity.y *= -1
		if coll_obj in get_tree().get_nodes_in_group("paddle"):
			velocity.x *= -1
			
		if coll_obj in get_tree().get_nodes_in_group("backboard"):
			velocity.x *= -1
			reset(3)
			if coll_obj in get_tree().get_nodes_in_group("p2Backboard"):
				get_parent().get_node("HUD").scoreP1()
			if coll_obj in get_tree().get_nodes_in_group("p1Backboard"):
				get_parent().get_node("HUD").scoreP2()
		



