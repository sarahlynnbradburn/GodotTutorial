extends Node2D
const GRASS_EFFECT = preload("res://effects/GrassEffect.tscn")

#You get this by holding ctrl while you drag and drop
@onready var area_2d: Area2D = $Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#This is how you setup the signal connection in the code, but 
	#it can also be completely done through the IDE
	area_2d.area_entered.connect(_on_area_2d_area_entered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#Signals should go up the tree, this one comes up from the area2D
func _on_area_2d_area_entered(other_intruding_area: Area2D) -> void:
	var grass_effect_instance = GRASS_EFFECT.instantiate()
	get_tree().current_scene.add_child(grass_effect_instance)
	grass_effect_instance.global_position = global_position
	queue_free()
	#print("grass area entered")
