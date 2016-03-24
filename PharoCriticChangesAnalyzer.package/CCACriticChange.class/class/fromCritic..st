as yet unclassified
fromCritic:	aCrit
	
	^ self new
		in: [ :inst |
			aCrit class instVarNames do: [ :varName |
				inst
					instVarNamed: varName
					put: (aCrit instVarNamed: varName) ] ];
		yourself