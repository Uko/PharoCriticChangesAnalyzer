as yet unclassified
= otherCrit

	^ self class   = otherCrit class and: [
	       version = otherCrit version and: [ 
	       entName = otherCrit entName and: [ 
	       rulName = otherCrit rulName ] ] ]