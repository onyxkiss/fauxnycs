class_name DesktopEnvironment
extends CanvasLayer

const WINDOW_PREFAB: String = "res://core/desk/desktop_window.tscn"

static var windows: Array[DesktopWindow] = []

static func new_window(content: Node, size: Vector2 = Vector2(460.0, 380.0)) -> DesktopWindow:
	var window: DesktopWindow = load(WINDOW_PREFAB).instantiate()
	window.size = size
	window.add_content(content)
	
	windows.append(window)
	Main.desktop_environment.add_child(window)
	return window
