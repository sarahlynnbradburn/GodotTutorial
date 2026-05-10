extends CharacterBody2D

const SPEED = 100.0

var input_vector = Vector2.ZERO

@onready var animation_tree: AnimationTree = $AnimationTree

func _physics_process(delta: float) -> void:
	
	input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	if input_vector != Vector2.ZERO:
		#y-axis is counterintuative in godot (and most game engines)
		#this lets us set up the animations intuatively in the blend 
		#state and then just inverse the direction calculation
		var direction_vector: = Vector2(input_vector.x, -input_vector.y)
		
		update_blend_positions(direction_vector)
		
	velocity = input_vector * SPEED
	move_and_slide()
	
func update_blend_positions(direction_vector: Vector2) -> void:
	animation_tree.set("parameters/StateMachine/MoveState/RunState/blend_position", direction_vector)
	animation_tree.set("parameters/StateMachine/MoveState/Standstate/blend_position", direction_vector)
