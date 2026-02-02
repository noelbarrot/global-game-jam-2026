extends Node2D
@export var AlienOpening : bool = false
@export var npcSkins = []

@onready var NPC = $"../NPCManager"
@onready var Alien = $"../SPR_Alien"
@onready var DialogueTimer = $"../SPR_Alien/DialoguePopulate"
@onready var DialogueParent = $"../NPCDiaglogue"
@onready var NPCDialogue = $"../NPCDiaglogue/Panel/RichTextLabel"
@onready var convoTimer = $ConversationTimer
@onready var statusButton = $"../Start Game/GridContainer/StartGameButton"

var currentConversation : Conversation
var alienAnswer : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	NPC._npc_walk_in()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Quit"):
		get_tree().quit()
	#print(DialogueTimer.time_left)

func _on_conversation_timer_timeout() -> void:
	if AlienOpening == false:
		currentConversation = NPC._get_conversation()
		NPCDialogue.text = currentConversation.opener.line
		DialogueParent.visible = true
		if Alien.humanReplies.find(currentConversation.reply) == -1:
			Alien.humanReplies.append(currentConversation.reply)
		DialogueTimer.start()
		
		#print(currentConversation.opener.line)
		#print(Alien.humanOpeners)
	else: pass #TODO Insert player choosing function here
	
func _get_alien_answer(chosenAnswer:String) -> void:
	var answer:String = chosenAnswer
	_match_lines(currentConversation.reply.line, answer)
	

func _update_alien_replies() -> void:
	#if Alien.humanReplies.find(currentConversation.reply) == -1:
		#Alien.humanReplies.append(currentConversation.reply)
	convoTimer.start()

func _match_lines(correctReply:String, givenAnswer:String) -> void:
	var answerStatus : String
	if correctReply == givenAnswer:
		answerStatus = "Correct"
	else: answerStatus = "Wrong"
	statusButton.text = answerStatus
	NPCDialogue.text = ""
	DialogueParent.visible = false
	NPC._npc_walk_out()
	#_update_alien_replies()
	
		
		
