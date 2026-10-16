extends Node2D

@onready var intro_player: AnimationPlayer = $"../IntroPlayer"
@onready var player: PlayerPlatformer = $"../Player"
@onready var floating_component: FloatingComponent = $"../ManuScript/FloatingComponent"


func _ready() -> void:
	player.input_locked = true
	floating_component.process_mode = Node.PROCESS_MODE_DISABLED

func start() -> void:
	intro_player.play("intro")
	await intro_player.animation_finished
	
	player.input_locked = false
	floating_component.process_mode = Node.PROCESS_MODE_INHERIT
