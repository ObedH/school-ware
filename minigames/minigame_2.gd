extends Node2D


func start() -> void:
	pass


func _on_answer_2_pressed() -> void:
	Global.next_level()


func _on_answer_3_pressed() -> void:
	Global.die()


func _on_answer_4_pressed() -> void:
	Global.die()


func _on_answer_5_pressed() -> void:
	Global.die()
