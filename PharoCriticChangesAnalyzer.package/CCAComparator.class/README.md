(((FLMaterializer materializeFromFileNamed: 'cropedCritics.fuel') asArray groupedBy: #rulSeverity) associations collect: [ :crits |
	CCAComparator critics: crits value description: crits key ]) groupedBy: [ :com | com preTrend sign @ com postTrend sign ]