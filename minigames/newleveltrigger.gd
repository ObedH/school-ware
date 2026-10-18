extends Sprite2D


func _on_area_2d_area_entered(area: Area2D) -> void:
	AudioManager.play_nxlv()
	Global.next_level()
