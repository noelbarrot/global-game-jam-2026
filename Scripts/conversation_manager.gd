extends Node2D
@export var AlienOpening : bool = false

@onready var NPC = $"../NPCManager"
@onready var Alien = $"../SPR_Alien"
@onready var NPCDialogue = $"../NPCDiaglogue/RichTextLabel"

var currentConversation : Conversation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_conversation_timer_timeout() -> void:
	if AlienOpening == false:
		currentConversation = NPC._get_conversation()
		Alien.humanOpeners.append(currentConversation.opener)
		NPCDialogue.text = currentConversation.opener.line
		#print(currentConversation.opener.line)
		#print(Alien.humanOpeners)
	else: pass #TODO Insert player choosing function here
	
func _match_lines() -> void:
	pass
		
