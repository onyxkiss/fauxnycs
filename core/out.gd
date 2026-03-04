class_name Out
extends Object

signal line_added(line: String)

static var out: Array[String] = []

static func info(text: String) -> void:
	out.append(text)
	print(text)
	Main.out.line_added.emit(text)
