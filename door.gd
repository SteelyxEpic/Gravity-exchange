extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var collision_shape_2d2: CollisionShape2D = $StaticBody2D2/CollisionShape2D



func open():
	show()
	var prev = Global.camera.get_parent()
	Global.camera.offset = Global.camera.global_position - global_position
	prev.remove_child(Global.camera)
	add_child(Global.camera)
	var tween:Tween = create_tween()
	tween.tween_property(Global.camera, "offset", Vector2(0, 0), 0.5)
	await tween.finished
	await get_tree().create_timer(0.5).timeout
	if collision_shape_2d.disabled:
		animation_player.play("close")
		collision_shape_2d.disabled = false
		collision_shape_2d2.disabled = false
		await animation_player.animation_finished
	else:
		animation_player.play("door")
		collision_shape_2d.disabled = true
		collision_shape_2d2.disabled = true
		await animation_player.animation_finished
		hide()
	remove_child(Global.camera)
	prev.add_child(Global.camera)
	Global.camera.offset = Vector2(0,0)
