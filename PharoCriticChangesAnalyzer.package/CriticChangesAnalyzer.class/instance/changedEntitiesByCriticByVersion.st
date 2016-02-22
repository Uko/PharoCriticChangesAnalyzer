as yet unclassified
changedEntitiesByCriticByVersion
	| changedEntitiesByCriticByVersion |

	changedEntitiesByCriticByVersion := Dictionary new.

	self criticFilesByVersion keysAndValuesDo: [ :version :criticFiles |
		self changesByVersion at: version ifPresent: [ :changedEntities |  
			changedEntitiesByCriticByVersion
				at: version
				put:
					(criticFiles collect: [ :file |
						file basename ->
						((file contents substrings: String lf) & changedEntities)
					]) asDictionary ] ].
			
	^ changedEntitiesByCriticByVersion