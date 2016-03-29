json-stuff
rulesFromJson

	| rules |
	
	rules := Set new.

	self jsonFiles do: [ :file |
		(STON fromStream: file readStream)
			do: [ :ruleDict |
				rules add: (ruleDict at: 'name') asSymbol ] ]
		displayingProgress: 'Crunching rules'.
		
	^ rules