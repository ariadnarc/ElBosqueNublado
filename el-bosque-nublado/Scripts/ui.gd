extends CanvasLayer

@onready var label = $MessageLabel

func _ready():
	add_to_group("UI")  # Muy importante: esto permite que Fragment lo encuentre

func show_message(text):
	label.text = text
	label.visible = true
	await get_tree().create_timer(3.0).timeout  # espera 3 segundos
	label.visible = false
