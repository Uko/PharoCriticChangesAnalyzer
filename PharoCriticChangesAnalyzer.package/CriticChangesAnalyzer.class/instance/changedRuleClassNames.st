as yet unclassified
changedRuleClassNames
	
	^ self changedEntitieNames
		reject: [ :name | (name endsWith: 'group') or: [ name endsWith: 'category' ] ]
		thenCollect: [ :name |
			(name allRegexMatches: '^\w+') first asSymbol ]