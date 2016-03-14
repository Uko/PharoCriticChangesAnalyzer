as yet unclassified
changedEntitieNames
	
	^ self changesByVersion values
		flatCollect: [ :ents | ents collect: #name ]
		as: Set