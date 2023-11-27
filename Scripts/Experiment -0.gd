extends Control

const TIME_PERIOD_0 = 2.3
const TIME_PERIOD_1 = 5.5
const TIME_PERIOD_2 = 9.1
const TIME_PERIOD_3 = 15.1
const TIME_PERIOD_4 = 18.7
const TIME_PERIOD_5 = 21.4
const TIME_PERIOD_6 = 23.8
const TIME_PERIOD_7 = 26.1
const TIME_PERIOD_8 = 28.5
const TIME_PERIOD_9 = 30.9
const TIME_PERIOD_10 = 33.3
const TIME_PERIOD_11 = 35.6
const TIME_PERIOD_12 = 38
const TIME_PERIOD_13 = 44
const TIME_PERIOD_14 = 47.6
const TIME_PERIOD_15 = 53.6
const TIME_PERIOD_16 = 57.2
const TIME_PERIOD_17 = 59.8
const TIME_PERIOD_18 = 62.2
const TIME_PERIOD_19 = 64.5
const TIME_PERIOD_20 = 66.9
const TIME_PERIOD_21 = 69.3
const TIME_PERIOD_22 = 71.7
const TIME_PERIOD_23 = 74
const TIME_PERIOD_24 = 76.4

var time = 0

var CustomMouseCursor1 = Global.CustomMouseCursor1
var CustomMouseCursor2 = Global.CustomMouseCursor2

@onready var clickbox_1 = $FightAnimation/Clickbox
@onready var clickbox_1_animation = $FightAnimation/Clickbox/ClickboxPressedAnimation
@onready var clickbox_2 = $FightAnimation/Clickbox2
@onready var clickbox_2_animation = $FightAnimation/Clickbox2/Clickbox2PressedAnimation

@onready var clickbox_arrow = $FightAnimation/ClickboxArrow
@onready var clickbox_arrow_animation = $FightAnimation/ClickboxArrow/ClickboxArrowPressedAnimation

@onready var collision_1_area = $FightAnimation/Collision1Area
@onready var collision_2_area = $FightAnimation/Collision2Area

@onready var health_bar = $FightAnimation/HealthBar
@onready var defend_animation = $FightAnimation/PlayerDefendAnimation
@onready var dodge_animation = $FightAnimation/PlayerDodgeAnimation
@onready var attack_animation = $FightAnimation/PlayerAttackAnimation
@onready var attack_2_animation = $FightAnimation/PlayerAttack2Animation
@onready var attack_3_animation = $FightAnimation/PlayerAttack3Animation

@onready var game_over_screen = $CanvasLayer/PlayerDeathAnimation/GameOverScreen
@onready var you_win_screen = $FightAnimation/YouWinScreen

enum State {
	STATE_0,
	STATE_1,
	STATE_2,
	STATE_3,
	STATE_4,
	STATE_5,
	STATE_6,
	STATE_7,
	STATE_8,
	STATE_9,
	STATE_10,
	STATE_11,
	STATE_12,
	STATE_13,
	STATE_14,
	STATE_15,
	STATE_16,
	STATE_17,
	STATE_18,
	STATE_19,
	STATE_20,
	STATE_21,
	STATE_22,
	STATE_23,
	STATE_24,
	STATE_25
}

var current_state = State.STATE_0

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
	
	health_bar.value = 100
	
func playerdeath():
	if health_bar.value == 0:
		$CanvasLayer/PlayerDeathAnimation.play("PlayerDeath")
		$"Experiment -0".stop()
		
func _on_PlayerDeathAnimation_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://Scenes/Experiment -0.tscn")
	
func screenshake():
	Global.camera.shake(100, 0.5, 100)
	
func screenshake_2():
	Global.camera.shake(50, 0.25, 50)
	
func stopmoving():
	$"FightAnimation/Experiment-0/Experiment-0MoveAnimation".stop()
	
func startmoving():
	$"FightAnimation/Experiment-0/Experiment-0MoveAnimation".play("Experiment-0Move")
	
func _process(delta):
	set_custom_mouse_cursor_1()
	if health_bar.value == 0:
		playerdeath()
	time += delta
	match current_state:
		State.STATE_0:
			if time > TIME_PERIOD_0:
				print("timeout_0")
				change_state(State.STATE_1)
		State.STATE_1:
			if Input.is_action_just_pressed("accept"):
				defend_animation.play("PlayerDefend")
				clickbox_1_animation.play("ClickboxPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_1:
				collision_2_area.position.y = 400
				print("timeout_1")
				change_state(State.STATE_2)
		State.STATE_2:
			if Input.is_action_just_pressed("cancel"):
				defend_animation.play("PlayerDefend")
				clickbox_2_animation.play("Clickbox2Pressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_2:
				print("timeout_2")
				collision_2_area.position.y = 400
				change_state(State.STATE_3)
		State.STATE_3:
			if Input.is_action_just_pressed("accept"):
				defend_animation.play("PlayerDefend")
				clickbox_1_animation.play("ClickboxPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_3:
				print("timeout_3")
				collision_2_area.position.y = 400
				change_state(State.STATE_4)
		State.STATE_4:
			if Input.is_action_just_pressed("cancel"):
				defend_animation.play("PlayerDefend")
				attack_animation.play("PlayerAttack")
				clickbox_2_animation.play("Clickbox2Pressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_4:
				print("timeout_4")
				collision_2_area.position.y = 400
				change_state(State.STATE_5)
		State.STATE_5:
			if Input.is_action_just_pressed("up"):
				dodge_animation.play("PlayerDodgeUp")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_5:
				print("timeout_5")
				collision_2_area.position.y = 400
				change_state(State.STATE_6)
		State.STATE_6:
			if Input.is_action_just_pressed("down"):
				dodge_animation.play("PlayerDodgeDown")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_6:
				print("timeout_6")
				collision_2_area.position.y = 400
				change_state(State.STATE_7)
		State.STATE_7:
			if Input.is_action_just_pressed("left"):
				dodge_animation.play("PlayerDodgeLeft")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_7:
				print("timeout_7")
				collision_2_area.position.y = 400
				change_state(State.STATE_8)
		State.STATE_8:
			if Input.is_action_just_pressed("right"):
				dodge_animation.play("PlayerDodgeRight")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_8:
				print("timeout_8")
				collision_2_area.position.y = 400
				change_state(State.STATE_9)
		State.STATE_9:
			if Input.is_action_just_pressed("down"):
				dodge_animation.play("PlayerDodgeDown")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_9:
				print("timeout_9")
				collision_2_area.position.y = 400
				change_state(State.STATE_10)
		State.STATE_10:
			if Input.is_action_just_pressed("up"):
				dodge_animation.play("PlayerDodgeUp")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_10:
				print("timeout_10")
				collision_2_area.position.y = 400
				change_state(State.STATE_11)
		State.STATE_11:
			if Input.is_action_just_pressed("right"):
				dodge_animation.play("PlayerDodgeRight")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_11:
				print("timeout_11")
				collision_2_area.position.y = 400
				change_state(State.STATE_12)
		State.STATE_12:
			if Input.is_action_just_pressed("left"):
				dodge_animation.play("PlayerDodgeLeft")
				attack_2_animation.play("PlayerAttack2")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_12:
				print("timeout_12")
				collision_2_area.position.y = 400
				change_state(State.STATE_13)
		State.STATE_13:
			if Input.is_action_just_pressed("cancel"):
				defend_animation.play("PlayerDefend")
				clickbox_2_animation.play("Clickbox2Pressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_13:
				print("timeout_13")
				collision_2_area.position.y = 400
				change_state(State.STATE_14)
		State.STATE_14:
			if Input.is_action_just_pressed("accept"):
				defend_animation.play("PlayerDefend")
				clickbox_1_animation.play("ClickboxPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_14:
				print("timeout_14")
				collision_2_area.position.y = 400
				change_state(State.STATE_15)
		State.STATE_15:
			if Input.is_action_just_pressed("cancel"):
				defend_animation.play("PlayerDefend")
				clickbox_2_animation.play("Clickbox2Pressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_15:
				print("timeout_15")
				collision_2_area.position.y = 400
				change_state(State.STATE_16)
		State.STATE_16:
			if Input.is_action_just_pressed("accept"):
				attack_animation.play("PlayerAttackOtherDirection")
				clickbox_1_animation.play("ClickboxPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_16:
				print("timeout_16")
				collision_2_area.position.y = 400
				change_state(State.STATE_17)
		State.STATE_17:
			if Input.is_action_just_pressed("left"):
				dodge_animation.play("PlayerDodgeLeft")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_17:
				print("timeout_17")
				collision_2_area.position.y = 400
				change_state(State.STATE_18)
		State.STATE_18:
			if Input.is_action_just_pressed("right"):
				dodge_animation.play("PlayerDodgeRight")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_18:
				print("timeout_18")
				collision_2_area.position.y = 400
				change_state(State.STATE_19)
		State.STATE_19:
			if Input.is_action_just_pressed("up"):
				dodge_animation.play("PlayerDodgeUp")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_19:
				print("timeout_19")
				collision_2_area.position.y = 400
				change_state(State.STATE_20)
		State.STATE_20:
			if Input.is_action_just_pressed("down"):
				dodge_animation.play("PlayerDodgeDown")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_20:
				print("timeout_20")
				collision_2_area.position.y = 400
				change_state(State.STATE_21)
		State.STATE_21:
			if Input.is_action_just_pressed("right"):
				dodge_animation.play("PlayerDodgeRight")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_21:
				print("timeout_21")
				collision_2_area.position.y = 400
				change_state(State.STATE_22)
		State.STATE_22:
			if Input.is_action_just_pressed("left"):
				dodge_animation.play("PlayerDodgeLeft")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_22:
				print("timeout_22")
				collision_2_area.position.y = 400
				change_state(State.STATE_23)
		State.STATE_23:
			if Input.is_action_just_pressed("down"):
				dodge_animation.play("PlayerDodgeDown")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_23:
				print("timeout_23")
				collision_2_area.position.y = 400
				change_state(State.STATE_24)
		State.STATE_24:
			if Input.is_action_just_pressed("up"):
				dodge_animation.play("PlayerDodgeUp")
				attack_3_animation.play("PlayerAttack3")
				clickbox_arrow_animation.play("ClickBoxArrowPressed")
				collision_2_area.position.y = 500
			if time > TIME_PERIOD_24:
				print("timeout_24")
				collision_2_area.position.y = 400
				change_state(State.STATE_25)
		State.STATE_25:
			pass
				
func change_state(next_state):
	current_state = next_state
	match current_state:
		State.STATE_0:
			print("Changing state to: State.STATE_0")
		State.STATE_1:
			print("Changing state to: State.STATE_1")
		State.STATE_2:
			print("Changing state to: State.STATE_2")
		State.STATE_3:
			print("Changing state to: State.STATE_3")
		State.STATE_4:
			print("Changing state to: State.STATE_4")
		State.STATE_5:
			print("Changing state to: State.STATE_5")
		State.STATE_6:
			print("Changing state to: State.STATE_6")
		State.STATE_7:
			print("Changing state to: State.STATE_7")
		State.STATE_8:
			print("Changing state to: State.STATE_8")
		State.STATE_9:
			print("Changing state to: State.STATE_9")
		State.STATE_10:
			print("Changing state to: State.STATE_10")
		State.STATE_11:
			print("Changing state to: State.STATE_11")
		State.STATE_12:
			print("Changing state to: State.STATE_12")
		State.STATE_13:
			print("Changing state to: State.STATE_13")
		State.STATE_14:
			print("Changing state to: State.STATE_14")
		State.STATE_15:
			print("Changing state to: State.STATE_15")
		State.STATE_16:
			print("Changing state to: State.STATE_16")
		State.STATE_17:
			print("Changing state to: State.STATE_17")
		State.STATE_18:
			print("Changing state to: State.STATE_18")
		State.STATE_19:
			print("Changing state to: State.STATE_19")
		State.STATE_20:
			print("Changing state to: State.STATE_20")
		State.STATE_21:
			print("Changing state to: State.STATE_21")
		State.STATE_22:
			print("Changing state to: State.STATE_22")
		State.STATE_23:
			print("Changing state to: State.STATE_23")
		State.STATE_24:
			print("Changing state to: State.STATE_24")
		State.STATE_25:
			print("Changing state to: State.STATE_25")
	
func _on_Clickbox_pressed():
	clickbox_1_animation.play("ClickboxPressed")

func _on_Clickbox2_pressed():
	clickbox_2_animation.play("Clickbox2Pressed")

func _on_Collision1Area_area_entered(area):
	match current_state:
		State.STATE_0:
			pass
		State.STATE_1:
			if "Collision" in area.name:
				health_bar.value -= 10
				playerdeath()
		State.STATE_2:
			if "Collision" in area.name:
				health_bar.value -= 10
				playerdeath()
		State.STATE_3:
			if "Collision" in area.name:
				health_bar.value -= 10
		State.STATE_4:
			if "Collision" in area.name:
				health_bar.value -= 10
		State.STATE_5:
			if "Collision" in area.name:
				health_bar.value -= 20
		State.STATE_6:
			if "Collision" in area.name:
				health_bar.value -= 20
		State.STATE_7:
			if "Collision" in area.name:
				health_bar.value -= 20
		State.STATE_8:
			if "Collision" in area.name:
				health_bar.value -= 20
		State.STATE_9:
			if "Collision" in area.name:
				health_bar.value -= 20
		State.STATE_10:
			if "Collision" in area.name:
				health_bar.value -= 20
		State.STATE_11:
			if "Collision" in area.name:
				health_bar.value -= 20
		State.STATE_12:
			if "Collision" in area.name:
				health_bar.value -= 20
		State.STATE_13:
			if "Collision" in area.name:
				health_bar.value -= 10
		State.STATE_14:
			if "Collision" in area.name:
				health_bar.value -= 10
		State.STATE_15:
			if "Collision" in area.name:
				health_bar.value -= 10
		State.STATE_16:
			if "Collision" in area.name:
				health_bar.value -= 10
		State.STATE_17:
			if "Collision" in area.name:
				health_bar.value -= 30
		State.STATE_18:
			if "Collision" in area.name:
				health_bar.value -= 30
		State.STATE_19:
			if "Collision" in area.name:
				health_bar.value -= 30
		State.STATE_20:
			if "Collision" in area.name:
				health_bar.value -= 30
		State.STATE_21:
			if "Collision" in area.name:
				health_bar.value -= 30
		State.STATE_22:
			if "Collision" in area.name:
				health_bar.value -= 30
		State.STATE_23:
			if "Collision" in area.name:
				health_bar.value -= 30
		State.STATE_24:
			if "Collision" in area.name:
				health_bar.value -= 30
		State.STATE_25:
			pass
			
func youwin():
	Global.level = 2

func _on_FightAnimation_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
