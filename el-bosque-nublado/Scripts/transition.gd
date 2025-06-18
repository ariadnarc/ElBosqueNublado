extends CanvasLayer

@onready var anim = $AnimationPlayer
@onready var rect = $ColorRect

func fade_out() -> void:
	rect.visible = true
	anim.play("fade_out")
	await anim.animation_finished

func fade_in() -> void:
	anim.play("fade_in")
	await anim.animation_finished
	rect.visible = false

func change_scene_with_fade(path: String) -> void:
	await fade_out()
	get_tree().change_scene_to_file(path)
	await fade_in()
