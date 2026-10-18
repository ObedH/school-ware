class_name Menu
extends Control

@onready var best_time: Label = $BestTime
@onready var play_button: TextureButton = $PlayButton


func _ready() -> void:
	play_button.grab_focus()
	if Global.best_time != 999999999999999:
		best_time.text = "Best Time: %.3fs" % Global.best_time

func _on_play_button_pressed() -> void:
	AudioManager.play_se()
	get_tree().change_scene_to_file("res://minigames/minigame_1.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit(0)
