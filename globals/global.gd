extends Node

var level_num: int = 1
var lives: int = 4
var total_time: float = 0
var best_time: float = 999999999999999

var levels: Array = [
	"res://minigames/minigame_1.tscn",
	"res://minigames/minigame_2.tscn",
	"res://minigames/minigame_3.tscn",
]


func next_level() -> void:
	if level_num >= levels.size():
		if total_time < best_time:
			best_time = total_time
		get_tree().change_scene_to_file.call_deferred("res://scenes/win/win.tscn")
		return
	level_num += 1
	get_tree().change_scene_to_file.call_deferred(levels[level_num - 1])


func die() -> void:
	lives -= 1
	if lives >= 1:
		get_tree().change_scene_to_file(levels[level_num - 1])
	else:
		get_tree().change_scene_to_file("res://scenes/death/death.tscn")


func restart() -> void:
	total_time = 0
	lives = 4
	level_num = 1
	get_tree().change_scene_to_file("res://scenes/menu/menu.tscn")
