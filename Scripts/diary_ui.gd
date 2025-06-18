extends CanvasLayer

@onready var panel := $Panel
@onready var close_button := $Panel/CerrarButton
@onready var label := $Panel/Label

func _ready():
	print("diaryuiholaaaaa")
	panel.visible = false  # Ocultamos el diario al empezar
	close_button.pressed.connect(_on_close_button_pressed)

func open_diary():
	panel.visible = true

func _on_close_button_pressed():
	panel.visible = false
