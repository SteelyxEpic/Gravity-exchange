extends Sprite2D

@onready var mechlever: Sprite2D = $Mechlever
@export var door: Array[Node2D]

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "main":
		area.get_parent().tpzone = self

func _on_area_2d_area_exit(area: Area2D) -> void:
	if area.get_parent().name == "main" and area.get_parent().tpzone == self:
		area.get_parent().tpzone = null

func tp(main:CharacterBody2D):
	var tween:Tween = create_tween()
	tween.tween_property(mechlever, "rotation_degrees", mechlever.rotation_degrees * -1, 1)
	await tween.finished
	for i in door:
		await i.open()
	main.move = true
