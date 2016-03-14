as yet unclassified
changedClassNames
	
	^ self changedEntitieNames
		collect: [ :name |
			(name allRegexMatches: '^\w+') first asSymbol ]
		as: Set