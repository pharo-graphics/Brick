baselines
baseline: spec
	<baseline>
	spec for: #common do: [ spec
			preLoadDoIt:  #preLoadActions:;
		   baseline: 'Bloc' with: [ spec
				postLoadDoIt: #postLoadBloc:;
				loads: #(stub); "Stub does not load anything here. We load Bloc in postLoadBloc:"
				repository: 'github://pharo-graphics/Bloc/src' ];
			
			package: #'Brick' with: [ spec requires: #('Bloc') ];
			package: #'Brick-Editor' with: [ spec requires: #('Brick'). ];
			package: #'Brick-Editor-Extensions' with: [ spec requires: #('Brick' 'Brick-Editor'). ];
			package: #'Brick-Material' with: [ spec requires: #('Brick'). ];
			package: #'Brick-Hydra' with: [ spec requires: #('Brick'). ];
			package: #'Brick-Examples' with: [ spec requires: #('Brick' 'Brick-Material'). ];
			
			"not used packages / to be removed"
			package: #'Brick-Style' with: [ spec requires: #('Brick'). ];
			package: #'Brick-UI' with: [ spec requires: #(#Brick). ];
			package: #'Brick-Sparta' with: [ spec requires: #(Brick). ];
			package: #'Brick-Experimental' with: [ spec requires: #('Brick-UI' 'Brick-Material'). ];
			
			"default groups"
			group: 'core' with: #(
				'Brick'
				'Brick-Editor'
				'Brick-Editor-Extensions'
				'Brick-Material'
				'Brick-Hydra'
				'Brick-Examples');
				
			group: 'development' with: #(
				'core'
			);

			group: 'stub' with: #();
			group: 'default' with: #('core')
			
		].