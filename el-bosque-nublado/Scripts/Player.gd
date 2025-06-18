extends CharacterBody2D

@export var speed := 100.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	var saved_pos = GameState.get_saved_position(get_tree().current_scene.scene_file_path)
	if saved_pos != Vector2.ZERO:
		global_position = saved_pos

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		position.x += speed * delta
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		position.x -= speed * delta
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		position.y -= speed * delta
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		position.y += speed * delta
	
	#flip sprite
	if velocity.x > 0:
		animated_sprite.play("walk_right")
	elif velocity.x < 0:
		animated_sprite.play("walk_left")
	elif velocity.y < 0:
		animated_sprite.play("walk_up")
	elif velocity.y > 0:
		animated_sprite.play("walk_down")
	else:
		animated_sprite.stop() # Stop animation if no movement
	
	velocity = direction.normalized() * speed 
	move_and_slide()
