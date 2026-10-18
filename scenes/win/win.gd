extends Control
@onready var back_button: TextureButton = $BackButton


func _ready() -> void:
	back_button.grab_focus()


func _on_back_pressed() -> void:
	Global.restart()
