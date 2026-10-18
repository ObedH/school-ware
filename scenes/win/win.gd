extends Control
@onready var back_button: TextureButton = $BackButton
@onready var label: Label = $Label


func _ready() -> void:
	back_button.grab_focus()
	label.text = "Time: %.3fs" % Global.total_time


func _on_back_pressed() -> void:
	Global.restart()
