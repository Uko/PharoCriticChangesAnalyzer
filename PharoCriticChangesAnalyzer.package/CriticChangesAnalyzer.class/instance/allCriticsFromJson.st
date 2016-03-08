json-stuff
allCriticsFromJson
	<skipVigorousCache>

	| critics rules entities counter |
	critics := OrderedCollection new: 15e6.
	counter := 0.

	self jsonFiles do: [ :file |
		| version |
		version := (file basename allButLast: 5) asNumber.
		(STON fromStream: file readStream) do: [ :ruleDict |
			| rulName rulGroup rulSeverity |
			rulName := (ruleDict at: 'name') asSymbol.
			rulGroup := (ruleDict at: 'group') asSymbol.
			rulSeverity := (ruleDict at: 'severity') asSymbol.
				
			(ruleDict at: 'critics') do: [ :crit |
				critics add: (CCACritic new
					entName: (crit at: 'name');
					entPackage: (crit at: 'package');
					rulName: rulName;
					rulGroup: rulGroup;
					rulSeverity: rulSeverity;
					version: version;
					yourself) ] ] ] 
		displayingProgress: [ :f | 'Processing ', f basename ].
		
	^ critics asArray