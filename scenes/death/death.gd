extends Control

@onready var menu_button: TextureButton = $MenuButton

func _ready() -> void:
	menu_button.grab_focus()

func _on_button_pressed() -> void:
	Global.restart()
