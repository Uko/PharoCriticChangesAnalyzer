json-stuff
criticsFromJsonSuchThat: aBlock 
	<skipVigorousCache>

	| critics |
	critics := OrderedCollection new.

	self jsonFiles do: [ :file |
		| version |
		version := (file basename allButLast: 5) asNumber.
		(STON fromStream: file readStream) do: [ :ruleDict |
			| rulName rulGroup rulSeverity |
			rulName := (ruleDict at: 'name') asSymbol.
			rulGroup := (ruleDict at: 'group') asSymbol.
			rulSeverity := (ruleDict at: 'severity') asSymbol.
				
			(ruleDict at: 'critics') do: [ :crit |
				| critic |
				critic := CCACritic new
					entName: (crit at: 'name');
					entPackage: (crit at: 'package');
					rulName: rulName;
					rulGroup: rulGroup;
					rulSeverity: rulSeverity;
					version: version;
					yourself.
				
				(aBlock value: critic) ifTrue: [
					critics add: critic ] ] ] ] 
		displayingProgress: [ :f | 'Processing ', f basename ].
		
	^ critics asArray