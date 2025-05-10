extends CanvasLayer

@export_file("*.json") var d_file: String

var dialogue = []
var current_dialogue_id = 0
var d_active = false

signal dialogue_finished
# Called when the node enters the scene tree for the first time.
func _ready():
	$NinePatchRect.visible = false
	 # remove
	
func start():
	if d_active: #here to stop starting a new one before finishing an old one
		return
	d_active = true
	$NinePatchRect.visible = true
	
	dialogue = load_dialogue()
	current_dialogue_id = -1 #so next script = 0
	next_script()
	
func load_dialogue(): #open json file into a string!! 
	var file = FileAccess.open(d_file, FileAccess.READ)
	if file:
		file.open(d_file, file.READ)
		return JSON.parse_string(file.get_as_text())

func _input(event):
	if not d_active:
		return
		
	if event.is_action_pressed("ui_accept"):
		next_script();

func next_script(): #changes to next script. 
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue): #gets the length of the dialogue
		d_active = false
		
		#$NinePatchRect.visible = false
		emit_signal("dialogue_finished")
		return
	
	$NinePatchRect/Name.text = dialogue[current_dialogue_id]['name']
	$NinePatchRect/Chat.text = dialogue[current_dialogue_id]['text']

func hide_dialogue():
	d_active = false
	$NinePatchRect.visible = false
	
	
	
	
	
	
func _on_timer_timeout():
	d_active = false# Replace with function body.
