extends Node2D
@export var npcSprites : Array[Sprite2D]

var startingPos : Vector2 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _change_skin() -> void:
	var spriteSize : int = npcSprites.size()
	var randomIndex : int
	randomIndex = randi_range(0,spriteSize-1)
	
