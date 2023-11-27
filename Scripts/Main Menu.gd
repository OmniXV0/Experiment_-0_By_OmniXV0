extends Control

@export var game_save_class: Script

var save_vars = ["youwintext2_pos"]

@onready var youwintext2 = $YouWinText2

var CustomMouseCursor1 = Global.CustomMouseCursor1
var CustomMouseCursor2 = Global.CustomMouseCursor2

func set_custom_mouse_cursor_1():
	Input.set_custom_mouse_cursor(CustomMouseCursor1)
	
func set_custom_mouse_cursor_2():
	Input.set_custom_mouse_cursor(CustomMouseCursor2)
	
func set_custom_mouse_cursor_appear():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func set_custom_mouse_cursor_disappear():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _ready():
	set_custom_mouse_cursor_1()
	set_custom_mouse_cursor_appear()
	
	$OmniXV0.visible = true
	$VOlihiN.visible = false
	
	load_world()
	if (Global.level == 2):
		$YouWinText2.position.y = 50
		save_world()
		
	set_custom_mouse_cursor_1()
	set_custom_mouse_cursor_appear()
	
func verify_save(world_save):
	for v in save_vars:
		if world_save.get(v) == null:
			return false
	return true
			
func load_world():
	if not FileAccess.file_exists("user://Experiment_-0 Save Files/Experiment_-0.tres"):
		return false
		
	var world_save = load("user://Experiment_-0 Save Files/Experiment_-0.tres")
	if not verify_save(world_save):
		return false
		
	$YouWinText2.position = world_save.youwintext2_pos
	return true
	
func save_world():
	var new_save = game_save_class.new()
	new_save.youwintext2_pos = $YouWinText2.position
	
	var dir = DirAccess.open("user://")
	if not dir.dir_exists("user://Experiment_-0 Save Files/"):
		dir.make_dir_recursive("user://Experiment_-0 Save Files/")
	
	ResourceSaver.save(new_save, "user://Experiment_-0 Save Files/Experiment_-0.tres")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
		$OmniXV0.visible = false
		$VOlihiN.visible = true
		$Background.color = Color(0, 0, 0, 1)
	if event is InputEventMouseButton || event is InputEventKey:
		if event.pressed:
			get_tree().change_scene_to_file("res://Scenes/Experiment -0.tscn")

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Experiment -0.tscn")
