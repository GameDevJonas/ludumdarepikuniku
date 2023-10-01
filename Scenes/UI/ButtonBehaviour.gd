extends Button

@export var on_click_event : EventAsset
var on_click_instance : EventInstance

@export var on_hover_event : EventAsset
var on_hover_instance : EventInstance

# Called when the node enters the scene tree for the first time.
func _ready():
	on_click_instance = RuntimeManager.create_instance(on_click_event)
	on_hover_instance = RuntimeManager.create_instance(on_hover_event)	

func _pressed():
	on_click_instance.start()
	

func _on_mouse_entered():
	on_hover_instance.start()
