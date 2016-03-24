json-stuff
diffCriticsFromJson
	<skipVigorousCache>

	| critics lastVersionCritics |
	critics := OrderedCollection new.
	lastVersionCritics := nil. "Ugly"

	self jsonFiles do: [ :file |
		| version currentCritics |
		currentCritics := OrderedCollection new.
		version := (file basename allButLast: 5) asNumber.
		(STON fromStream: file readStream) do: [ :ruleDict |
			| rulName rulGroup rulSeverity |
			rulName := (ruleDict at: 'name') asSymbol.
			rulGroup := (ruleDict at: 'group') asSymbol.
			rulSeverity := (ruleDict at: 'severity') asSymbol.
				
			(ruleDict at: 'critics') do: [ :crit |
				currentCritics add: (CCACritic new
					entName: (crit at: 'name');
					entPackage: (crit at: 'package');
					rulName: rulName;
					rulGroup: rulGroup;
					rulSeverity: rulSeverity;
					version: version;
					yourself) ] ].
			
			lastVersionCritics ifNotNilDo: [ 
				lastVersionCritics do: [ :crit |
					crit version: version ].
				currentCritics \ lastVersionCritics
					collect: [ :crit | CCACriticChange fromAddedCritic: crit ]
					into: critics.
				lastVersionCritics \ currentCritics
					collect: [ :crit | CCACriticChange fromRemovedCritic: crit ]
					into: critics ].
			
			lastVersionCritics := currentCritics ] 
		displayingProgress: [ :f | 'Processing ', f basename ].
		
	^ critics asArray