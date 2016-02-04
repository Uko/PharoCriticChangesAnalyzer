as yet unclassified
criticDirectories

	^ self class criticHistoryDir directories select: [ :dir |
		dir path basename matchesRegex: '\d{5}' ]