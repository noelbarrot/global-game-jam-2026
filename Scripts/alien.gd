extends Sprite2D

@export var alienPhrases : Array[String]

@onready var optionParent = $"../OptionSelection"
@onready var option1 = $"../OptionSelection/GridContainer/Option1"
@onready var option2 = $"../OptionSelection/GridContainer/Option2"
@onready var option3 = $"../OptionSelection/GridContainer/Option3"
@onready var option4 = $"../OptionSelection/GridContainer/Option4"
@onready var option5 = $"../OptionSelection/GridContainer/Option5"

@onready var conversationManager = $"../ConversationManager"

var dialogueOptions : Array[String]
var humanOpeners : Array[Opener]
var humanReplies : Array[Reply]
var finalAnswer : String

func _populate_options() -> void:
	optionParent.visible = true
	#Check if correct reply is in alien vocabulary and if so add it do answer options.
	var correctReply : int = humanReplies.find(conversationManager.currentConversation.reply)
	var humanReplySize: int = humanReplies.size()
	if correctReply != -1:
		var correctLine : String = humanReplies[correctReply].line
		dialogueOptions.append(correctLine)
	
	#Check if there are any human replies available and add up to two to answer options randomly
	if humanReplySize > 0:
		if humanReplySize == 1:
			dialogueOptions.append(humanReplies[0].line)
		elif humanReplySize > 1:
			var randHumanReplies : int = 2
			while randHumanReplies > 0:
				var randomIndex : int = randi_range(0,humanReplySize-1)
				dialogueOptions.append(humanReplies[randomIndex].line)
				randHumanReplies -= 1
			
	#Fill rest of answer options with alien phrases
	var dialogueOptionSize : int = dialogueOptions.size()
	var optionTotal : int = 5 - dialogueOptionSize
	var arraySize : int = alienPhrases.size()
	while optionTotal > 0:
		var randomIndex : int = randi_range(0,arraySize-1)
		dialogueOptions.append(alienPhrases[randomIndex])
		optionTotal -=1
	dialogueOptions.shuffle()
	option1.text = dialogueOptions[0]
	option2.text = dialogueOptions[1]
	option3.text = dialogueOptions[2]
	option4.text = dialogueOptions[3]
	option5.text = dialogueOptions[4]

func _clear_options() -> void:
	option1.text = ""
	option2.text = ""
	option3.text = ""
	option4.text = ""
	option5.text = ""
	optionParent.visible = false

func _on_dialogue_populate_timeout() -> void:
	_populate_options()




func _on_option_5_pressed() -> void:
	conversationManager._get_alien_answer(option5.text)
	_clear_options()


func _on_option_4_pressed() -> void:
	conversationManager._get_alien_answer(option4.text)
	_clear_options()


func _on_option_3_pressed() -> void:
	conversationManager._get_alien_answer(option3.text)
	_clear_options()


func _on_option_2_pressed() -> void:
	conversationManager._get_alien_answer(option2.text)
	_clear_options()


func _on_option_1_pressed() -> void:
	conversationManager._get_alien_answer(option1.text)
	_clear_options()
