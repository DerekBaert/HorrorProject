extends CanvasLayer
class_name ItemUILayer

@onready var closeButton: Button = $Control/MarginContainer/VBoxContainer/HBoxContainer2/CloseButton
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var control: Control = $Control

#Item Resource
@onready var itemDescription: RichTextLabel = $Control/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer/ItemDescription
@onready var itemImage: TextureRect = $Control/MarginContainer/VBoxContainer/HBoxContainer/MarginContainer2/ItemImage

signal itemUITriggered
signal itemUIHidden

func _ready() -> void:
	itemUITriggered.connect(_onItemUITriggered)
	closeButton.pressed.connect(_onCloseButtonPressed)
	control.hide()

func _onItemUITriggered(resource:ItemResource)->void:
	control.show()
	animationPlayer.play("FadeIn")
	updateItem(resource)
	
	await get_tree().create_timer(3).timeout
	closeButton.grab_focus()
	

func _input(event: InputEvent) -> void:
	if control.visible:
		if event.is_action_pressed("cancel") or event.is_action_pressed("ui_accept"):
			_onCloseButtonPressed()

# Update the item info based on the assigned resource
func updateItem(resource:ItemResource) -> void:
	if resource.itemDescription:
		itemDescription.text = resource.itemDescription
	else:
		return
	if resource.itemImage:
		itemImage.texture = resource.itemImage
	else:
		return

## Remove the item overlay
func _onCloseButtonPressed() -> void:
	itemUIHidden.emit()
	control.hide()
