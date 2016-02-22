as yet unclassified
changesFiles

	^ self class changesDir files select: [ :file |
		file basename matchesRegex: '\d{5}' ]