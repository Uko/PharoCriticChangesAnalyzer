as yet unclassified
changesByVersion

	^ (self changesFiles collect: [ :file |
		file basename asNumber ->
		((file contents substrings: String lf) collect: [ :string |
			| parts |
			parts := string substrings: '.'.
			CCAEntity new
				package: parts first asSymbol;
				name:  parts second asSymbol;
				yourself ]) ]) asDictionary