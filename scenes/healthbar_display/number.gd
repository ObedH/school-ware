extends TextureRect

@export var numbers: Array[Texture]


func show_number(j: int) -> void:
	if numbers[j]:
		texture = numbers[j]
