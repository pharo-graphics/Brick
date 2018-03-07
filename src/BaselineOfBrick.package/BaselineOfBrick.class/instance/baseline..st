baselines
baseline: spec
	<baseline>
	spec for: #common do: [ spec
			preLoadDoIt:  #preLoadActions:;
		   baseline: 'Bloc' with: [ spec
				postLoadDoIt: #postLoadBloc:;
				loads: #(stub); "Stub does not load anything here. We load Bloc in postLoadBloc:"
				repository: 'github://pharo-graphics/Bloc/src' ];
			
			package: #Brick with: [ spec requires: #('Bloc') ];
			package: #'Brick-Style' with: [ spec requires: #('Brick'). ];
			package: #'Brick-Theme' with: [ spec requires: #('Brick-Style' ). ];
			package: #'Brick-Material' with: [ spec requires: #('Brick-Theme' ). ];
			package: #'Brick-UI' with: [ spec requires: #(#Brick  'Brick-Theme'). ];
			package: #'Brick-Editor' with: [ spec requires: #(Brick 'Brick-Theme'). ];
			package: #'Brick-Editor-Extensions' with: [ spec requires: #(Brick 'Brick-Theme' 'Brick-Editor'). ];
			package: #'Brick-Sparta' with: [ spec requires: #(Brick 'Brick-Theme'). ];
			package: #'Brick-Examples' with: [ spec requires: #('Brick-UI' 'Brick-Material'). ];
			package: #'Brick-Experimental' with: [ spec requires: #('Brick-UI' 'Brick-Material'). ];
			
			"default groups"
			group: 'core' with: #(
				'Brick-Editor'
				'Brick-Editor-Extensions');
				
			group: 'development' with: #(
				'core'
				'Brick-UI'
				'Brick-Examples'
				'Brick-Sparta'
				'Brick-Experimental'
			);

			group: 'stub' with: #();
			group: 'default' with: #('core')
			
		].