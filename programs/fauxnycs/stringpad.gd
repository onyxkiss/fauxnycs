extends FakeProcess

var _res: FakeFile = null

func main() -> void:
	_res = load(args[0])
	if _res: Out.info(_res.content)
