as yet unclassified
critcFilesByVersion

	^ self criticDirectoriesNonempty collect: [ :pharoV | 
		pharoV basename -> (pharoV files reject: [ :criticFile |
			criticFile basename = '.done'  ]) ]