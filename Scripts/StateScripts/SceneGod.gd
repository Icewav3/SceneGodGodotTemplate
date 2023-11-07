extends Node

static var Scenes = {
	"MenuState" : "res://Scenes/States/MainMenu/MenuState.tscn",
	"GameState" : "res://Scenes/States/Game.tscn"
}
#Debug Mode
@export var DebugMode: bool
#current playstate
var currentState = null

func _ready():
	var root = get_tree().root
	currentState = root.get_child(root.get_child_count() - 1)
	print("current scene: "+str(currentState))
	goto_scene(Scenes["MenuState"]) #initalize main menu
	currentState = root.get_child(root.get_child_count() - 1)
	print("current scene: "+str(currentState))
func _process(_delta):
	pass

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	currentState.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	currentState = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(currentState)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
#	get_tree().currentState = currentState
