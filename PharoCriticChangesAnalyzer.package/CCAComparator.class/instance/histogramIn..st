as yet unclassified
histogramIn: composite
<gtInspectorPresentationOrder: 1>

	composite roassal2
		title: 'Plot';
		initializeView: [ RTGrapher new ];
		painting: [ :b | | ds|
			b extent: 800 @ 300.
			ds := RTData new. 
			ds barShape width: 1;
				if: [:v | v x <= self class breakVersion ] fillColor: Color blue;
				if: [:v | v x > self class breakVersion ] fillColor: Color red.
	ds points: versionPoints.
	ds x: [ :p | p x - 50000 ].
	ds y: #y.
	b add: ds.
	b axisX noLabel; noTick. b axisY noDecimal.
	b build.
	b view ]