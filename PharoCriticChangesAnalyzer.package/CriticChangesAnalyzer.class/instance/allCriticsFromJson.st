json-stuff
allCriticsFromJson
	<skipVigorousCache>

	| critics rules entities |
	critics := SortedCollection sortBlock: [ :a :b | a version < b version ].
	rules := Set new.
	entities := Set new.

	self jsonFiles do: [ :file |
		| version |
		version := (file basename allButLast: 5) asNumber.
		(version - 50185) abs < 20 ifTrue: [ 
		(STON fromStream: file readStream) do: [ :ruleDict |
			| rule |
			rule := CCARule new
				name: (ruleDict at: 'name');
				group: (ruleDict at: 'group');
				severity: (ruleDict at: 'severity');
				yourself.
			rule := rules nastyAdd: rule.
				
			(ruleDict at: 'critics') do: [ :crit |
				critics add: (CCACritic new
					entity: (entities nastyAdd: (CCAEntity new
						name: (crit at: 'name');
						package: (crit at: 'package');
						yourself));
					rule: rule;
					version: version;
					yourself) ] ] ] ]
		displayingProgress: [ :f | 'Processing ', f basename ].
		
	^ critics