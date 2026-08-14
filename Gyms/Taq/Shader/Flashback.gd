extends Node2D

@export var flashbackImages: Array[Texture]
@onready var flashbackImage: Sprite2D = $FlashbackImage
@onready var glitchFilter: ColorRect = $GlitchFilter
@export var flashbackTime:float = .1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	glitchFilter.hide()
	flashbackImage.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


## Hook this up with signal or call it from somewhere to trigger the flashback
func swapFlashbackImage()->void:
	glitchFilter.show()
	flashbackImage.show()
	flashbackImage.texture = flashbackImages.pick_random()
	await get_tree().create_timer(flashbackTime).timeout
	flashbackImage.hide()
	glitchFilter.hide()




# TEST ############
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		swapFlashbackImage()
		
