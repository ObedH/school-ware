class_name Minigame
extends Node2D

@export var healthbar_dissapear_duration: float = 0.5

var healthbar_display_tween: Tween

@onready var healthbar_display: HealthbarDisplay = $HealthbarDisplay


func _ready() -> void:
	healthbar_display.finished.connect(_on_healthbar_display_finished)
	#get_tree().paused = true
	healthbar_display.start()


func _on_healthbar_display_finished() -> void:
	if healthbar_display_tween:
		healthbar_display_tween.kill()
	
	healthbar_display_tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	
	healthbar_display_tween.tween_property(healthbar_display, "offset_transform_position:y", 180, healthbar_dissapear_duration)

	await healthbar_display_tween.finished
	
	get_tree().paused = false
