extends Sprite2D

@onready var mechlever: Sprite2D = $Mechlever
@export var door: Node2D

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "main":
		area.get_parent().tpzone = self

func _on_area_2d_area_exit(area: Area2D) -> void:
	if area.get_parent().name == "main" and area.get_parent().tpzone == self:
		area.get_parent().tpzone = null

func tp(main:CharacterBody2D):
	mechlever.rotation_degrees = -90
	var tween:Tween = create_tween()
	tween.tween_property(mechlever, "rotation_degrees", 90, 1)
	await tween.finished
	door.open()
	main.move = true
