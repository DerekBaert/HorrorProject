extends CanvasLayer

@onready var closeButton: Button = $Control/MarginContainer/VBoxContainer/HBoxContainer2/CloseButton
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

#Item Resource
@export var item:itemResource
@onready var itemDescription: RichTextLabel = $Control/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/ItemDescription
@onready var itemImage: TextureRect = $Control/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer2/ItemImage

func _ready() -> void:
	animationPlayer.play("FadeIn")
	get_tree().paused = true
	updateItem()
	closeButton.pressed.connect(_onCloseButtonPressed)


func _process(delta: float) -> void:
	
	# Enable close button by Esc key
	if Input.is_action_just_pressed("cancel"):
		_onCloseButtonPressed()

func updateItem() -> void:
	if item.itemDescription:
		itemDescription.text = item.itemDescription
	else:
		return
	if item.itemImage:
		itemImage.texture = item.itemImage
	else:
		return



# Remove the item overlay
func _onCloseButtonPressed() -> void:
	get_tree().paused = false
	queue_free()
