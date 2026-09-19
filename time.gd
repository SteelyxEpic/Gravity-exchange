extends RichTextLabel

var times:float = 0
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(time)


func time():
	times += 0.05
	text = "%.2f" % times + "s"
