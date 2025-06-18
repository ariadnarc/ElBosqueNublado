extends Area2D

@onready var label := $Label
var player_in_area := false

func _ready():
	label.visible = false
	self.body_entered.connect(_on_body_entered)
	self.body_exited.connect(_on_body_exited)

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("ui_accept"): # 'espacio' por defecto
		show_diary()

func _on_body_entered(body):
	if body.name == "Player":
		player_in_area = true
		label.visible = true

func _on_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		label.visible = false

func show_diary():
	get_tree().call_group("UI", "open_diary")
