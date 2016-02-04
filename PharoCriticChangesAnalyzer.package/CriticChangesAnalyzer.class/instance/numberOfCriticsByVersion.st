as yet unclassified
numberOfCriticsByVersion

	^ self entitiesByCriticByVersion collect: [ :entitiesByCritic |
		entitiesByCritic values inject: 0 into: [ :sum :entities | sum + entities ]  ]