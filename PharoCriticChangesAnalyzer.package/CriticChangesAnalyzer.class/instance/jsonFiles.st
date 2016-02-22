json-stuff
jsonFiles

	^ self class criticHistoryDir files select: [ :file |
		file basename endsWith: '.json' ]