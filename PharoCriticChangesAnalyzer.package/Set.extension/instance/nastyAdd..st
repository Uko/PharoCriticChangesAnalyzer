*PharoCriticChangesAnalyzer
nastyAdd: newObject

	| index el |
	index := self scanFor: newObject.
	(el := array at: index) ifNil: [self atNewIndex: index put: newObject asSetElement].
	^ el ifNil: [ newObject ]