extends Node
class_name Inventory


@export var inventorySize : int

var inventoryItems : Array[ItemResource]

const emptyItemPath : String = "res://Items/EmptyItem.tres"

const debugApplePath : String = "res://Items/Apple.tres"

const debugSwordPath : String = "res://Items/Sword.tres"


func _ready() -> void:
	
	createSlots()
	

func createSlots()-> void:
	
	for i in inventorySize:
		
		inventoryItems.append(load(emptyItemPath))

func addItem(item : ItemResource) -> bool:
	
	
	item = item.duplicate()
	
	for i in inventoryItems.size() - 1:
		
		if inventoryItems[i].itemName != "":
			
			if inventoryItems[i].itemName == item.itemName and inventoryItems[i].currentStack < inventoryItems[i].maxStack:
				inventoryItems[i].currentStack += 1
				return true
			
			else:
				continue
			
		inventoryItems[i] = item
		return true
	
	return false

func printInventory():
	
	
	for i in inventoryItems:
		print(i.itemName)
		print(i.currentStack)

func detectItem(area):
	
	if !area is ItemPickup:
		return
	
	if addItem(area.item):
		
		area.queue_free()
		printInventory()
	

func getAllValidItems() -> Array[ItemResource]:
	
	var validItems : Array[ItemResource]
	
	for i in inventoryItems:
		
		if i.itemName == "":
			continue
		
		validItems.append(i)
	
	return validItems
