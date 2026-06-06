extends CharacterBody2D

@export var range: = 104
const SPEED = 30

#Control on drop creates the onready
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var playback = animation_tree.get("parameters/StateMachine/playback") as AnimationNodeStateMachinePlayback

#in the world, you can add the player to individual bats 
@export var player: Player

func _physics_process(delta: float) -> void: 
	var state = playback.get_current_node()
	match state: 
		"Idle": pass
		"Chase":
			var player = get_player()
			if player is Player:
				velocity = global_position.direction_to(player.global_position) * SPEED
			else:
				velocity = Vector2.ZERO
			move_and_slide()


func get_player() -> Player:
	return get_tree().get_first_node_in_group("player")

func is_player_in_range() -> bool:
	var result = false
	var player: = get_player()
	
	print(player)	
	#null check
	if player is Player:
		var distance_to_player = global_position.distance_to(player.global_position)
		if distance_to_player < range:
			result = true
	return result
		
		
		
