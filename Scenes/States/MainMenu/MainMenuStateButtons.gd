extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("Exit"):
		close()

func _on_quit_button_pressed():
	close()


func close():
	get_tree().quit()


func _on_start_button_pressed():
	var path = SceneGod.Scenes["GameState"]
	SceneGod.goto_scene(path)
