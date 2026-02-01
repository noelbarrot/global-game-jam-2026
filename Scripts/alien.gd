extends Sprite2D

@export var alienPhrases : Array[String] = ["Interesting, is it warm or immoral?", "That reminds me of the '99 Pyramids of Titan incident", "NIGHTMARE NIGHTMARE NIGHTMARE", "How will that effect the famine on ZX-11? You have to be more socially conscious.", "For me this is a Tuesday, there's nothing interesting about what you just said.", "\"Look at me! I have two lungs and a dream!\" That's you, that's what you sound like.", "Has no-one cleared the cargo deck?", "Has the bulkhead been washed yet?", "Did the klalarp leave the captain's quarters yet?", "Isn't that banned in five solar systems?", "Did the ma-tata fall in the waste tank again?", "Everybody knows you don't drink that in normal gravity.", "You sound like a boiling r’lapdopic.", "Have you just come from the environmental replenishment systems? You smell like it.", "What?! You're eating so close after a realspace translation?!", "Just come from the crew quarters have you?", "Been working on the lower decks?", "If I'm not careful I'll start talking marine!", "Mind your head there, the hatches are too low.", "Did you seal your compartment on your way out?", "Have the micrometeors stopped yet?", "A sentence related to the weather.", "Finished reading your planet's endtime parables, the end is truly near.", "Listen, if I see some crops that don't have circles? I might get a bit agitated, just saying.", "Clarpdop kibble doople farple, and what have you.", "Good thing I'm not human.", "This will all mean nothing one day.", "The tree has fallen, why are you arguing about it.", "Well, if the plumkle gestates, then the driver gets his license.", "You don't let the snarks into the ventilation! You know that!", "If it's all gone purple, then it's all gone bad.", "As weak as a horse! As smart as an ox!", "WHO IS YOUR MOTHER?", "Is your leader Gthetic or Cnonotic?", "Waste Product to Edible Ration synthesisation is undergoing rapid growth!", "I have invested 18'000 Martian Denari into SPACECOIN, my family will not survive the coming solar eclipse.", "How does one attain riches without violence? My research shows it is impossible.", "Did someone leave the airlock open?", "Where are the robo-women? I heard there would be robo-women. Your leaders have invested millions of their currency into robo-women. Where are they.", "Does the pope live in the woods? I need to know if the pope lives in the woods.", "Direct me to the highest-ranking member of your planet's military.", "I gotta get at least a tablespoon of PlasRay Certified Coolant NOW or things are going to go sideways.", "Do you guys still use tanneries or has civilisation finally degenerated?", "You remind me of a human I once saw in a Zoo.", "They keep building those stupid monoliths everywhere, it's glorified graffiti.", "[AIR RAID SIREN]", "Hypothetically, where would Earth's primary Neurotransmitter be located?", "Took half a gistop, three chinimol, and a whole strithanadil I got from from my Lunarian plug, it's time to fenn out once again.", "The Strogg were misunderstood artists, that factory was awesome.", "They're talking on the psychosomatic brainwaves like we can't hear them.", "What is Klonk? Do you know him?", "I bought this book and they keep writing this guy's name in red ink.", "Did you just come off your duty rotation?"]

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
	var correctLine : String
	if correctReply != -1:
		correctLine = humanReplies[correctReply].line
		dialogueOptions.append(correctLine)
	
	#Check if there are any human replies available and add up to two to answer options randomly
	if humanReplySize > 0:
		if humanReplySize == 1:
			if dialogueOptions.find(humanReplies[0].line) == -1:
				dialogueOptions.append(humanReplies[0].line)
		elif humanReplySize > 1:
			var randHumanReplies : int = 2
			while randHumanReplies > 0:
				var randomIndex : int = randi_range(0,humanReplySize-1)
				var lineOption = humanReplies[randomIndex].line
				if dialogueOptions.find(lineOption) == -1:
					dialogueOptions.append(humanReplies[randomIndex].line)
					randHumanReplies -1
				else: randHumanReplies -= 1
			
	#Fill rest of answer options with alien phrases
	var dialogueOptionSize : int = dialogueOptions.size()
	var optionTotal : int = 5 - dialogueOptionSize
	var arraySize : int = alienPhrases.size()
	while optionTotal > 0:
		var randomIndex : int = randi_range(0,arraySize-1)
		if dialogueOptions.find(alienPhrases[randomIndex]) == -1:
			dialogueOptions.append(alienPhrases[randomIndex])
			optionTotal -=1
		else: continue
	
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
