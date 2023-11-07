extends Node2D
#Zoom Sesitivity
@export var Zoom_Sensitivity = Vector2(0.1, 0.1)
#Max zoom out
var min_range: Vector2 = Vector2(0.5, 0.5)
#Max zoom in
var max_range: Vector2 = Vector2(2.0, 2.0)
#Current zoom value
var zoom = 1
#connected camera
var cam: Camera2D

var debug : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	debug = SceneGod.DebugMode
	#print(debug)
	cam = $Camera2D

func _input(event):
	#prevent zooming too much
	if event.is_action_pressed("Zoom_in") && cam.zoom < max_range:
		cam.zoom += Zoom_Sensitivity
		zoom = true
	elif event.is_action_pressed("Zoom_out")&& cam.zoom > min_range:
		cam.zoom -= Zoom_Sensitivity
		zoom = true
	else:
		zoom = false
	if debug && zoom: #Write to console
		print(cam.zoom)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
