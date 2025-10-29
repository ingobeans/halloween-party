extends Control

func show_interact():
	$InteractIcon.visible = true
	
func hide_interact():
	$InteractIcon.visible = false

func show_message(text:String):
	$Text/Label.text = text
	$Text.visible = true
	
func hide_message():
	$Text.visible = false
