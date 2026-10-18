extends Node2D

var apple_pressed: bool = false
var flower_pressed: bool = false
var banana_pressed: bool = false
var duck_pressed: bool = false
var washington_pressed: bool = false

@onready var apple: TextureButton = $"../Apple"
@onready var flower: TextureButton = $"../Flower"
@onready var banana: TextureButton = $"../Banana"
@onready var washington: TextureButton = $"../Washington"
@onready var duck: TextureButton = $"../Duck"



func start() -> void:
	pass


func do_completion_check() -> void:
	if apple_pressed and banana_pressed and duck_pressed and washington_pressed and flower_pressed:
		Global.next_level()


func _on_apple_pressed() -> void:
	apple_pressed = true
	apple.hide()
	do_completion_check()


func _on_flower_pressed() -> void:
	flower_pressed = true
	flower.hide()
	do_completion_check()


func _on_banana_pressed() -> void:
	banana_pressed = true
	banana.hide()
	do_completion_check()


func _on_washington_pressed() -> void:
	washington_pressed = true
	washington.hide()
	do_completion_check()


func _on_duck_pressed() -> void:
	duck_pressed = true
	duck.hide()
	do_completion_check()


func _on_mouse_pressed() -> void:
	Global.die()


func _on_scissors_pressed() -> void:
	Global.die()


func _on_pencil_pressed() -> void:
	Global.die()


func _on_lamp_pressed() -> void:
	Global.die()
