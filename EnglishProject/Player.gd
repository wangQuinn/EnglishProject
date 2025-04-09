extends Node2D

var sprite = Sprite2D
var npc: Node2D
var dialogue_handler: CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#sprite = get_node("playerSprite")
	
	#npc = get_tree().root.get_node("NPC")
	#dialogue_handler = npc.get_node("Dialogue")
	#dialogue_handler.connect("dialogue_finished", Callable(self, "_on_dialogue_finished"))
	#sprite.visible = false;
	
#func _on_dialogue_finished():
	# Show the new Sprite2D
	#sprite.visible = true


