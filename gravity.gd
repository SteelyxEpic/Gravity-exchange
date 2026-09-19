extends Sprite2D

@onready var rotat: Sprite2D = $Tprotate
@onready var anim: AnimationPlayer = $AnimationPlayer
var intele:bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotat.get_child(0).visibility_changed.connect(func():
		if not rotat.get_child(0).visible:
			$"../main".OppositeGravity = not $"../main".OppositeGravity)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "main" and not rotat.visible:
		area.get_parent().tpzone = self
		
func _on_area_2d_area_exit(area: Area2D) -> void:
	if area.get_parent().name == "main" and area.get_parent().tpzone == self:
		area.get_parent().tpzone = null

func tp(main:CharacterBody2D):
	rotat.show()
	rotat.global_position = main.global_position
	rotat.position.y -= 750
	var tween:Tween = create_tween()
	tween.tween_property(rotat, "global_position", main.global_position, 2)
	await tween.finished
	anim.play("rotate")
	await anim.animation_finished
	rotat.hide()
	main.move = true
		
