extends Panel

@onready var item_visuals: Sprite2D = $inventory_display

func update(item: Inv_Item):
	if !item:
		item_visuals.visible = false
	else:
		item_visuals.visible = true
		item_visuals.texture = item.texture
