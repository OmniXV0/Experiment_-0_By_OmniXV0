extends Camera2D

@onready var shakeTimer = $Timer

var shake_amount = 0
var default_offset = offset

func _ready():
	Global.camera = self
	set_process(false)

func _process(delta):
	offset = Vector2(randf_range(-shake_amount, shake_amount), randf_range(shake_amount, -shake_amount)) * delta + default_offset
	
func shake(new_shake, shake_time = 0.4, shake_limit = 100):
	var tween = create_tween()
	
	shake_amount += new_shake
	if shake_amount > shake_limit:
		shake_amount = shake_limit
		
	shakeTimer.wait_time = shake_time
	
	tween.stop()
	set_process(true)
	shakeTimer.start()

func _on_Timer_timeout():
	var tween = create_tween()
	shake_amount = 0
	set_process(false)
	tween.tween_property(self, "offset", default_offset, 0.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN_OUT)
	tween.play()
