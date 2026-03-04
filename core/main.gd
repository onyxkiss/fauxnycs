class_name Main
extends Node

const DESKTOP_ENVIRONMENT_SCENE: String = "res://core/desk/dekstop_environment.tscn"
const PANIC_SCENE: String = "res://core/panic.tscn"

static var instance: Main
static var desktop_environment: DesktopEnvironment = null
static var processes: Array[FakeProcess] = []
static var out: Out = Out.new()

func _ready() -> void:
	instance = self	
	desktop_environment = load(DESKTOP_ENVIRONMENT_SCENE).instantiate()
	add_child(desktop_environment)
	
	exec("res://programs/fauxnycs/terminal.gd", ["argtest"])

static func exec(script_path: String, args: Array[String] = []) -> void:
	var process: FakeProcess = load(script_path).new()
	processes.append(process)
	process.args = args
	process.main()

static func do(command: String) -> void:
	var parts: PackedStringArray = command.strip_edges().split(" ", false)
	if parts.is_empty():
		return
	var cmd_name: String = parts[0]
	var args: PackedStringArray = parts.slice(1)
	match cmd_name:
		"quit": instance.get_tree().quit()
		"armageddon": panic()
		"exec": 
			if args.size() >= 1: exec(args[0], Array(args.slice(1)))
			else: Out.info("Usage: exec <script_path> [args...]")
		_: Out.info("Unknown command: " + cmd_name)

static func panic() -> void:
	instance.get_tree().change_scene_to_file(PANIC_SCENE)
