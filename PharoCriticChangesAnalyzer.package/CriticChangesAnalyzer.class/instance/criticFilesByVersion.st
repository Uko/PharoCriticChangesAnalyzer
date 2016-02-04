as yet unclassified
criticFilesByVersion

	^ (self criticDirectoriesNonempty collect: [ :pharoV | 
		pharoV basename -> (pharoV files reject: [ :criticFile |
			criticFile basename = '.done'  ]) ]) asDictionary 