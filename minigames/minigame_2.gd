extends Node2D


func start() -> void:
	pass


func _on_answer_2_pressed() -> void:
	AudioManager.play_nxlv()
	Global.next_level()


func _on_answer_3_pressed() -> void:
	AudioManager.play_exp()
	Global.die()


func _on_answer_4_pressed() -> void:
	AudioManager.play_exp()
	Global.die()


func _on_answer_5_pressed() -> void:
	AudioManager.play_exp()
	Global.die()
