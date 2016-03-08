as yet unclassified
changesByVersion

	^ (self changesFiles collect: [ :file |
		file basename asNumber ->
		((file contents substrings: String lf) collect: #asSymbol) ]) asDictionary