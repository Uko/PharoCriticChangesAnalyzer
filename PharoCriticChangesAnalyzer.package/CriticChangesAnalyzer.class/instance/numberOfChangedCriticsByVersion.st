as yet unclassified
numberOfChangedCriticsByVersion

	^ self changedEntitiesByCriticByVersion collect: [ :entitiesByCritic |
		entitiesByCritic values inject: 0 into: [ :sum :entities | sum + entities size ]  ]