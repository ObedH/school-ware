extends Node

var level_num: int = 1
var lives: int = 4

var levels: Array = [
	"res://minigames/minigame_1.tscn"
]


func next_level() -> void:
	if level_num >= levels.size():
		print("Level oob!")
		return
	level_num += 1
	get_tree().change_scene_to_file(levels[level_num - 1])
