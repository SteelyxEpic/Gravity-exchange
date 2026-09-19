extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer



func open():
	var prev = Global.camera.get_parent()
	Global.camera.offset = Global.camera.global_position - global_position
	prev.remove_child(Global.camera)
	add_child(Global.camera)
	var tween:Tween = create_tween()
	tween.tween_property(Global.camera, "offset", Vector2(0, 0), 0.5)
	await tween.finished
	await get_tree().create_timer(0.5).timeout
	animation_player.play("door")
	await animation_player.animation_finished
	remove_child(Global.camera)
	prev.add_child(Global.camera)
	Global.camera.offset = Vector2(0,0)
	hide()
