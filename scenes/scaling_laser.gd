extends CharacterBody2D

# Enemy properties
var speed = 200.0  # Adjust this for the enemy's movement speed
var scale_up =  true


func _physics_process(_delta):
	velocity = speed * Vector2.UP
	move_and_slide()

func _on_scale_timer_timeout() -> void:
	if scale_up:
		%AnimationPlayer.play("scale-up")
		scale_up = false
	elif GameState.hard_mode:
		%AnimationPlayer.play("scale-right")
		scale_up = true
		#move up and down to dodge
	else:
		scale_up = true
