api projectSpec
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'PharoCriticChangesAnalyzer'
				with: [ spec requires: #('Roassal2' 'VigorousCache' 'SciSmalltalk') ].
			
			spec project: 'Roassal2' with: [
  				spec
    					className: 'ConfigurationOfRoassal2';
    					version: 'stable';
    					repository: 'http://smalltalkhub.com/mc/ObjectProfile/Roassal2/main' ].
				
			spec project: 'SciSmalltalk' with: [
  				spec
    					className: 'ConfigurationOfSciSmalltalk';
    					version: 'stable';
    					repository: 'http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo50/main' ] ]. 
			
			spec
  				 baseline: 'VigorousCache'
  				 with: [ spec repository: 'github://Uko/PharoVigorousCache:v1.0.0' ]