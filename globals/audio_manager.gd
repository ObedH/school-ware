extends Node

@onready var nx_lv_sfx: AudioStreamPlayer = $NxLvSFX
@onready var exp_sfx: AudioStreamPlayer = $ExpSFX
@onready var select: AudioStreamPlayer = $Select


func play_nxlv() -> void:
	nx_lv_sfx.play()


func play_exp() -> void:
	exp_sfx.play()


func play_se() -> void:
	select.play()
