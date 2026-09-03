extends Resource
class_name EventResource
# Parent resource for events, includes name, description and the type of event.
@export var eventName:String
@export var eventDescription:String
var type: EventTypes.EventType
