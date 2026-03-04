extends FakeProcess

var _window: DesktopWindow = null
var _label: RichTextLabel = null

func main() -> void:
	var ui: PanelContainer = PanelContainer.new()
	ui.set_anchors_preset(Control.PRESET_FULL_RECT)
	
	var stylebox = StyleBoxFlat.new()
	stylebox.bg_color = Color(0.0, 0.0, 0.0, 1.0)
	ui.add_theme_stylebox_override("panel", stylebox)
	
	_label = RichTextLabel.new()
	_label.add_theme_font_override("normal_font", load("res://core/res/mono_system_font.tres"))
	
	Main.out.line_added.connect(_add_text)
	for line in Out.out:
		_add_text(line)
	
	ui.add_child(_label)
	
	_window = DesktopEnvironment.new_window(ui, Vector2(460.0, 380.0))
	Out.info("Welcome to the terminal . . .")

func _add_text(text: String) -> void:
	_label.append_text(text)
