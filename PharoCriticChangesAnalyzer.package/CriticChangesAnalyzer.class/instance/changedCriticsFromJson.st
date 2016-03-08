json-stuff
changedCriticsFromJson
	<skipVigorousCache>

	| critics counter |
	critics := OrderedCollection new.
	counter := 0.

	self jsonFiles do: [ :file |
		| version changes |
		version := (file basename allButLast: 5) asNumber.
		changes := self changesByVersion at: version ifAbsent: #().
		
		(STON fromStream: file readStream) do: [ :ruleDict |
			| rulName rulGroup rulSeverity |
			rulName := (ruleDict at: 'name') asSymbol.
			rulGroup := (ruleDict at: 'group') asSymbol.
			rulSeverity := (ruleDict at: 'severity') asSymbol.
				
			(ruleDict at: 'critics') do: [ :crit |
				| entName |
				entName := crit at: 'name'.
				(changes includes: entName) ifTrue: [ 
				
					critics add: (CCACritic new
						entName: (crit at: 'name');
						entPackage: (crit at: 'package');
						rulName: rulName;
						rulGroup: rulGroup;
						rulSeverity: rulSeverity;
						version: version;
						yourself) ] ] ] ] 
		
		displayingProgress: [ :f | 'Processing ', f basename ].
		
	^ critics asArray