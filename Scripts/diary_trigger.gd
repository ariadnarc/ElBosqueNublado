extends Area2D

@onready var label = $Label
var player_inside = false

func _ready():
	label.visible = false

func _on_body_entered(body):
	if body.name == "Player":
		player_inside = true
		label.visible = true

func _on_body_exited(body):
	if body.name == "Player":
		player_inside = false
		label.visible = false

func _process(delta):
	if player_inside and Input.is_action_just_pressed("diary_toggle"):  # "ui_accept" suele ser espacio
		# Llama a la función para abrir el diario
		get_tree().call_group("UI", "open_diary")
