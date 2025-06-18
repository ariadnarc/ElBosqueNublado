extends Area2D

@export var message: String = "Este fragmento parece contener un recuerdo..."
@export var diary_entry: String = "He encontrado algo importante."

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		print("fragmento recogido")
		get_tree().call_group("UI", "show_message", message)
		GameState.add_diary_entry(diary_entry)
		queue_free()  # El fragmento desaparece tras recogerlo
