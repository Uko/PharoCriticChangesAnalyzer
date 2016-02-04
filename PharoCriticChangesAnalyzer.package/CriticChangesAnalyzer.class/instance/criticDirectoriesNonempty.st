as yet unclassified
criticDirectoriesNonempty

	^ self criticDirectories 
		reject: [ :pharoV | pharoV  files size = 1  ]