class_name HealthbarDisplay
extends Control

signal finished

@export var stay_time: float = 2

var timer: float

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@onready var notebook_1: Notebook = $Notebook1
@onready var notebook_2: Notebook = $Notebook2
@onready var notebook_3: Notebook = $Notebook3
@onready var notebook_4: Notebook = $Notebook4


func start() -> void:
	timer = 0
	match Global.lives:
		3:
			notebook_4.destroy()
		2:
			notebook_3.destroy()
		1:
			notebook_2.destroy()
		0:
			notebook_1.destroy()


func _process(delta: float) -> void:
	timer += delta
	texture_progress_bar.value = 100 - 100 * (timer / stay_time)
	if timer >= stay_time:
		finished.emit()
