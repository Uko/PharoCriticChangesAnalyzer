as yet unclassified
percentageOfChangesWithCriticsByVersion
	| percentageOfChangesWithCriticsByVersion |

	percentageOfChangesWithCriticsByVersion := Dictionary new.

	self criticFilesByVersion keysAndValuesDo: [ :version :criticFiles |
		self changesByVersion at: version ifPresent: [ :changedEntities |  
			percentageOfChangesWithCriticsByVersion
				at: version
				put:
					(criticFiles inject: 0 into: [ :sum :file |
						sum +
						((file contents substrings: String lf) & changedEntities) size
					]) / changedEntities size ] ].
			
	^ percentageOfChangesWithCriticsByVersion