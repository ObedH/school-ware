class_name Minigame
extends Node2D

@export var healthbar_dissapear_duration: float = 0.5
@export var minigame_name: String
@export var minigame_time: float = 10.0
@export var director: Node2D

var healthbar_display_tween: Tween
var minigame_timer: float
var timering: bool = false

@onready var healthbar_display: HealthbarDisplay = $HealthbarDisplay
@onready var time_displayer: Label = $TimeDisplayer


func _ready() -> void:
	healthbar_display.finished.connect(_on_healthbar_display_finished)
	get_tree().paused = true
	healthbar_display.start(minigame_name)
	minigame_timer = minigame_time
	time_displayer.text = "Text: %.3f" % minigame_timer


func _process(delta: float) -> void:
	if timering:
		minigame_timer -= delta
		time_displayer.text = "Time: %.3f" % minigame_timer
		
		if minigame_timer <= 0:
			Global.die()
	



func _on_healthbar_display_finished() -> void:
	if healthbar_display_tween:
		healthbar_display_tween.kill()
	
	healthbar_display_tween = get_tree().create_tween()
	healthbar_display_tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	healthbar_display_tween.set_ease(Tween.EASE_OUT)
	healthbar_display_tween.set_trans(Tween.TRANS_CUBIC)
	healthbar_display_tween.tween_property(healthbar_display, "offset_transform_position:y", 180, healthbar_dissapear_duration)

	await healthbar_display_tween.finished
	get_tree().paused = false
	
	if director and "start" in director:
		await director.start()
	
	timering = true
