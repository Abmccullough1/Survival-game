extends CharacterBody2D

var speed = 100
var player_state

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up","down")
	
	if direction.x == 0 and direction.y == 0 :
		player_state = "idle"
	elif direction.x !=0 or direction.y !=0:
		player_state = "walking"
	
	velocity = direction*speed
	move_and_slide()

	play_animation(direction)
	
func play_animation(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle-south")
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("walking-north")
		if dir.x == 1:
			$AnimatedSprite2D.play("walking-east")
		if dir.y == 1:
			$AnimatedSprite2D.play("walking-south")
		if dir.x == -1:
			$AnimatedSprite2D.play("walking-west")
		if dir.x > 0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("walking-northeast")
		if dir.x > 0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("walking-southeast")
		if dir.x < -0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("walking-southwest")
		if dir.x < -0.5 and dir.y <-0.5:
			$AnimatedSprite2D.play("northwest")
 
