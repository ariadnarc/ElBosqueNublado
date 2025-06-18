extends CanvasLayer

@onready var panel = $Panel
@onready var entry = $Panel/EntryText

var diary_text := "Día 1: La niebla me cubre. No recuerdo por qué estoy aquí.\n"

func _ready():
	panel.visible = false
	entry.text = diary_text
	add_to_group("Diary")  # Esto permite que otros nodos llamen a este script

func _input(event):
	if event.is_action_pressed("diary_toggle"):
		toggle_diary()

func toggle_diary():
	panel.visible = !panel.visible

func add_entry(new_text: String):
	diary_text += "\n" + new_text
	entry.text = diary_text

func _on_Button_pressed():
	panel.visible = false
