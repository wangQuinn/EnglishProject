extends Node2D

var npc: Node2D
var dialogue_handler: CanvasLayer
var awaiting_response:= false
var prompt: Sprite2D

signal awaiting
signal request_new_dialogue


# Called when the node enters the scene tree for the first time.
func _ready():
	npc= get_node("NPC")
	dialogue_handler = get_node("NPC/Dialogue")
	dialogue_handler.connect("dialogue_finished", Callable(self, "_on_dialogue_finished"))
	prompt = get_node("Prompt")
	prompt.visible = false
	

func _on_dialogue_finished():
	#prompt user 
	
	prompt.visible = true
	awaiting_response = true

	print("Y/N")
	
	
func _input(event):
	if awaiting_response and (event.is_action_pressed("ui_yes") or event.is_action_pressed("ui_no")):
		if event.is_action_pressed("ui_yes"):
			print("yes is pressed")
			
		else:
			print("no is pressed")
			
		prompt.visible = false
		new_npc()
		dialogue_handler.hide_dialogue()
			
		
		

		
		
func new_npc():
	npc.exit_NPC()
			
	
			
