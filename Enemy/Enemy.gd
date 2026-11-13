extends CharacterBody3D

@export var inventory : Inventory

const PICKUPITEM = "res://ItemPickup/ItemPickup.tscn"

func _ready() -> void:
	
	
	for i in 10:
		inventory.addItem(load("res://Items/Apple.tres"))

func die(body):
	
	if body is Player:
		for i in inventory.getAllValidItems():
			
			var itemInstance = load(PICKUPITEM).instantiate()
			itemInstance.position = position + Vector3(randf_range(-10, 10), 0, randf_range(-10, 10))
			itemInstance.item = i
			get_parent().add_child(itemInstance)
		
		queue_free()
