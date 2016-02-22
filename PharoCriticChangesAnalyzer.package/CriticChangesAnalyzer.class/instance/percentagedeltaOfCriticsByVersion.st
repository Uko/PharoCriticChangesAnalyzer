as yet unclassified
percentagedeltaOfCriticsByVersion
	| percentagedeltaOfCriticsByVersion |

	percentagedeltaOfCriticsByVersion := Dictionary new.

	self deltaOfCriticsByVersion keysAndValuesDo: [ :version :critcsDelta |
		self changesByVersion at: version ifPresent: [ :changedEntities |  
			percentagedeltaOfCriticsByVersion
				at: version
				put: critcsDelta / changedEntities size ] ].
			
	^ percentagedeltaOfCriticsByVersion