as yet unclassified
deltaOfCriticsByVersion

	^ ((self numberOfCriticsByVersion associations sorted: [ :a :b |
		a key asNumber < b key asNumber ]) overlappingPairsDo: [ :a :b |
			b key -> (b value - a value) ]) asDictionary 