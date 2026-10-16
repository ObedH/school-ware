class_name FloatingComponent
extends Node2D

@export var actor: Node2D

var freq = 1.5
var mag = 0.05
var tim: float = 0

func _process(delta: float) -> void:
	tim += delta
	actor.position.y += cos(tim * freq) * mag
