as yet unclassified
printOn: aStream

	aStream
		nextPutAll: description;
		nextPut: $ ;
		nextPutAll: preTrend asString;
		nextPut: $ ;
		nextPutAll: postTrend asString 