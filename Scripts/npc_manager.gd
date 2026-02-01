extends Node2D

@export var npcSpriteArray : Array[PackedScene]
@export var conversations : Array[Conversation]
@onready var convoTimer = $"../ConversationManager/ConversationTimer"

@onready var animations : AnimationPlayer = $AnimationPlayer
var npcOpening : bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _npc_walk_in() -> void:
	animations.play("walkIn")
	convoTimer.start()
	
func _npc_walk_out() -> void:
	animations.play("walkOut")


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


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "walkOut":
		_npc_walk_in()
