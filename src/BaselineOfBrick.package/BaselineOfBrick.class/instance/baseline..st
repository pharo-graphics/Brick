baselines
baseline: spec
	<baseline>
	spec for: #common do: [ spec
			postLoadDoIt: #postLoadActions:;
		
		   baseline: 'Bloc' with: [ spec
				loads: #(#'core' 'Bloc-Animation');
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
			package: #'Brick-Examples' with: [ spec requires: #('Brick-UI' ). ];
			package: #'Brick-Experimental' with: [ spec requires: #('Brick-UI' ). ];
			
			
			"default groups"
			group: 'core' 
				with: #( 'Brick-UI' 'Brick-Examples' 'Brick-Experimental' );
			group: 'development' with: #('core');
			
			"groups with git support"
			group: 'git:core' with: #('core');
			group: 'git:development' with: #('development');
			
			group: 'default' with: #('core')
		].