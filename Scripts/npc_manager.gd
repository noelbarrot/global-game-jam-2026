extends Node2D

@export var conversations : Array[Conversation]

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("select"):
		_get_conversation()
	

func _get_conversation() -> void:
	var arrayLength : int = conversations.size()
	var conversationIndex : int = randi_range(0,arrayLength-1)
	#var conversationIndex : int = 0
	var loadedConversation : Conversation = conversations[conversationIndex]
	var conversationOpener: String =loadedConversation.opener.line
	print(conversationOpener)
	
