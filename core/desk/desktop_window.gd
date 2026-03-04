class_name DesktopWindow
extends PanelContainer

@export var content_node: Control

func add_content(content: Node) -> void:
	content_node.add_child(content)
