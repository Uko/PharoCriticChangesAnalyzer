as yet unclassified
entitiesByCriticByVersion

	^ (self criticFilesByVersion  collect: [ :criticFiles | 
		(criticFiles collect: [ :file |
			file basename ->
			(file contents substrings: String lf) ] ) asDictionary ])  