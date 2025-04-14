extends Node2D

var playButton: TextureButton
var quitButton: TextureButton

func _ready():
	playButton = $VBoxContainer/PlayButton
	quitButton = $VBoxContainer/QuitButton

#game moves to next scene when play button is pressed
func _on_play_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Main.gd")

#when quit button is pressed, game quits
func _on_quit_button_pressed() -> void:
	get_tree().quit()
