as yet unclassified
initializeCritics: anArray description: aString
	| lr |
	
	description := aString.
	
	versionPoints  := (anArray groupedBy: #version) associations collect: [ :ass |
		ass key @ ass value size ].
	
	lr:=DhbLinearRegression  new.
	versionPoints select: [ :p | p x <= self class breakVersion ] thenDo:[ :p | lr add: p ].
	preTrend := [ lr asEstimatedPolynomial at: 1 ] on: ZeroDivide do: [0].
	
	lr:=DhbLinearRegression  new.
	versionPoints select: [ :p | p x > self class breakVersion ] thenDo:[ :p | lr add: p ].
	postTrend :=  [ lr asEstimatedPolynomial at: 1 ] on: ZeroDivide do: [0].
	
	