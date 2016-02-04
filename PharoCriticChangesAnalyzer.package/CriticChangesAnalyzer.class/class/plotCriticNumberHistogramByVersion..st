as yet unclassified
plotCriticNumberHistogramByVersion: associations

	| b ds |
	b := RTGrapher new.
	b extent: 800 @ 300.
	ds := RTData new. 
	ds barShape
		width: 1;
		if: [:v | v value < 0 ] fillColor: Color blue;
		if: [:v | v value > 0 ] fillColor: Color red.
	ds points: associations.
	ds y: [ :pair | pair value "sign * pair value abs sqrt" ].
	b add: ds.
	b axisX noLabel; noTick. b axisY noDecimal.
	b build.
	^ b view