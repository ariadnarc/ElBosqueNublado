extends Area2D

@export var sceneToChange : String
@onready var timer: Timer = $Timer
var player_body: Node2D  # Guardamos aquí el cuerpo que entró
var can_teleport := false

func _ready():
	can_teleport = false
	await get_tree().create_timer(0.5).timeout
	can_teleport = true

func _on_body_entered(body: Node2D) -> void:
	#mira si se puede teletransportar
	if not can_teleport:
		return
		
	print("Entered new Scene")
	
	player_body = body  # Guardamos el jugador
	
	Engine.time_scale = 0.5
	
	if body.has_node("CollisionShape2D"):
		body.get_node("CollisionShape2D").queue_free()
		
	timer.start()

func _on_timer_timeout() -> void:
	# Guardamos la posición antes de cambiar de escena
	if player_body:
		GameState.save_player_position(
			get_tree().current_scene.scene_file_path,
			player_body.global_position
		)
	Engine.time_scale = 1
	call_deferred("_change_scene")

func _change_scene():
	await Transition.change_scene_with_fade(sceneToChange)
