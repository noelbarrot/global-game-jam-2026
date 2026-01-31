extends Node2D

@export var convesations : Array[Conversation]
var loadedConversation : Conversation
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("select"):
		_get_conversation()
	



func _get_conversation() -> void:
	var arrayLength : int = convesations.size()
	var conversationOpener: String = convesations[0].opener.line
	print(conversationOpener)
	
