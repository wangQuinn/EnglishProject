extends Node2D

@export var character_name: String
var dialogue_handler: CanvasLayer 
var animation_player : AnimationPlayer
var target_position = Vector2(500,300)
var isLeaving := false
var script_paths = [
	"res://json/BeggarChat.json",
	"res://json/GeorgeChat.json",
	"res://json/SamChat.json"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue_handler = get_node("Dialogue")
	animation_player = $AnimationPlayer
	next_NPC()
	#slide_in()
	


func randomize_script():
	var selected_script = script_paths[randi() % script_paths.size()]
	dialogue_handler.d_file = selected_script
	
	
	

func _on_animation_player_animation_finished(anim_name):
		if anim_name == "slide_out2": 
			print("finished sliding out")
			next_NPC()
			return
		else:
			$Timer.start()
	
	
	
func next_NPC():
	animation_player.play("slide_in")
	print("Next npc")
	
	
	randomize_script()
	print(dialogue_handler.d_file)
	
func exit_NPC():
	isLeaving = true
	
	await get_tree().create_timer(1.0).timeout
	animation_player.play("slide_out2")
	
	
	print("NPC created")
	
	

func _on_timer_timeout():
	animation_player.play("idle")
	dialogue_handler.start()

	
	

	
