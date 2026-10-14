class_name Notebook
extends TextureRect

const NOTEBOOK = preload("uid://bigicihpq0e04")
const NOTEBOOK_BROKEN = preload("uid://brytau4rokihb")


func undestroy() -> void:
	texture = NOTEBOOK


func destroy() -> void:
	texture = NOTEBOOK
