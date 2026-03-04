class_name FakeFilesystem

static func save(filename: String = "New File", filetype: String = "", content: String = "", folder: String = "user://documents/") -> void:
	if folder.begins_with("res://"):
		Out.info("Can't save to res://!")
	else:
		var file: FakeFile = FakeFile.new()
		file.filename = filename
		file.filetype = filetype
		file.content = content
		ResourceSaver.save(file, folder + filename + ".tres")

static func open(file_resource: FakeFile) -> void:
	match file_resource.filetype:
		".sc": open(load(file_resource.content))
		".gd": Main.exec(file_resource.content)
		_: Out.info("Can't open fakefile %s" % str(file_resource) + "!")
