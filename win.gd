extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().name == "main":
		$"../../main/Time/Timer".stop()
		$"../../main/win".show()
