extends Node2D

@export var conversations : Array[Conversation]
var npcOpening : bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("select"):
		_get_conversation()

func _get_conversation() -> Conversation:
	var arrayLength : int = conversations.size()
	var conversationIndex : int = randi_range(0,arrayLength-1)
	var loadedConversation : Conversation = conversations[conversationIndex]
	return loadedConversation
	#if npcOpening == true:
		#_send_opener(loadedConversation)
	##else: _send_reply(loadedConversation)
	
func _send_opener(chosenConversation) -> void:
	var conversationOpener : Opener = chosenConversation.opener
	print(conversationOpener.line)

#func _match_reply(chosenConversation) -> Reply:
	#var conversationReply : Reply = chosenConversation.reply
	#return conversationReply
	
