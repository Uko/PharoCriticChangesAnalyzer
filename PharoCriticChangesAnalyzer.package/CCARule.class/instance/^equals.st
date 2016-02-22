as yet unclassified
= otherCCARule

  ^ self class == otherCCARule class and: [ 
	self name = otherCCARule name and: [ 
	self group = otherCCARule group and: [ 
	self severity = otherCCARule severity ] ] ]