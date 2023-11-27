extends Control

var CustomMouseCursor1 = Global.CustomMouseCursor1
var CustomMouseCursor2 = Global.CustomMouseCursor2

var pause_menu = self
@onready var continue_button = $ContinueButton
@onready var quit_button = $QuitButton

func set_custom_mouse_cursor_1():
	Input.set_custom_mouse_cursor(CustomMouseCursor1)
	
func set_custom_mouse_cursor_2():
	Input.set_custom_mouse_cursor(CustomMouseCursor2)
	
func set_custom_mouse_cursor_appear():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func set_custom_mouse_cursor_disappear():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		set_custom_mouse_cursor_2()
		get_tree().paused = not get_tree().paused
		pause_menu.visible = not pause_menu.visible
		
		continue_button.grab_focus()
		quit_button.grab_focus()

func _on_continue_button_pressed() -> void:
	set_custom_mouse_cursor_1()
	get_tree().paused = false
	pause_menu.visible = false

func _on_quit_button_pressed() -> void:
	set_custom_mouse_cursor_1()
	get_tree().paused = false
	pause_menu.visible = false
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")

func _on_pause_button_pressed():
	set_custom_mouse_cursor_2()
	get_tree().paused = true
	pause_menu.visible = true
