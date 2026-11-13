extends Area3D
class_name ItemPickup

@export var item : ItemResource
@onready var itemText = $ItemText

func _ready() -> void:
	
	itemText.text = item.itemName
