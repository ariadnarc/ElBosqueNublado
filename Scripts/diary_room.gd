extends Node2D

func _ready():
	# Cargar la escena del UI del diario
	var DiaryUI_scene = preload("res://UI/DiaryUI.tscn")
	
	# Crear una instancia del UI
	var diary_ui = DiaryUI_scene.instantiate()
	
	# Añadirla como hija de esta escena
	add_child(diary_ui)
	
	# Añadirla al grupo "UI" para que los fragmentos puedan comunicarse con ella
	diary_ui.add_to_group("UI")
