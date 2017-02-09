baselines
baseline: spec
	<baseline>
	spec for: #common do: [ spec
			preLoadDoIt:  #preLoadActions:;
			postLoadDoIt: #postLoadBrick:;
		   baseline: 'Bloc' with: [ spec
				postLoadDoIt: #postLoadBloc:;
				loads: #(stub); "Stub does not load anything here. We load Bloc in postLoadBloc:"
				repository: 'github://pharo-graphics/Bloc/src' ];

			project: 'PetitCSS' with: [ spec
				className: #ConfigurationOfPetitCSS;
				versionString: '1.1';
				repository: 'http://smalltalkhub.com/mc/GlennCavarle/PetitCSS/main/' ];
			
			package: #Brick with: [ spec requires: #('Bloc'). ];
			package: #'Brick-Style' with: [ spec requires: #('Brick'). ];
			package: #'Brick-Theme' with: [ spec requires: #('Brick-Style' ). ];
			package: #'Brick-Material' with: [ spec requires: #('Brick-Theme' ). ];
			package: #'Brick-UI' with: [ spec requires: #(#Brick  'Brick-Theme'). ];
			package: #'Brick-Text' with: [ spec requires: #(#Brick  'Brick-Theme'). ];
			package: #'Brick-Text-Tests' with: [ spec requires: #(#Brick 'Brick-Text' 'Brick-Theme'). ];
			package: #'Brick-Examples' with: [ spec requires: #('Brick-UI' 'Brick-Material'). ];
			package: #'Brick-Experimental' with: [ spec requires: #('Brick-UI' 'Brick-Material'). ];
			
			"default groups"
			group: 'core' 
				with: #( 'Brick-UI' 'Brick-Examples' 'Brick-Experimental' 'Brick-Text');
			group: 'development' with: #('core' 'Brick-Text-Tests');
			
			group: 'file:core' with: #('core');
			group: 'file:development' with: #('development');
			
			"groups with git support"
			group: 'git:core' with: #('core');
			group: 'git:development' with: #('development');

			group: 'stub' with: #();
			group: 'default' with: #('core')
			
		].