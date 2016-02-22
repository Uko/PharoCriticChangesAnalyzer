as yet unclassified
changesByVersion

	^ (self changesFiles collect: [ :file |
		file basename ->
		(file contents substrings: String lf) ]) asDictionary