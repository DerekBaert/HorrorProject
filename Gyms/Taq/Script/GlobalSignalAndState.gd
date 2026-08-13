extends Node

# ===========================================
## Global Signal

# Item Interaction
signal itemUITriggered
signal itemUIHidden
signal notificationTriggered (notificationMessage:String)


# Player State
var canMove:bool = true
var canInteract:bool = false
