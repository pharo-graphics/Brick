Class {
	#name : #BaselineOfBrickWidgets,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickWidgets
}

{ #category : #baseline }
BaselineOfBrickWidgets >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			"baseline: 'PharoBootstrap' with: [
				spec
					repository: '';
					loads: 'KernelGroup' ];"

			baseline: 'BlocCore' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			baseline: 'BlocLayout' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			baseline: 'BlocText' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];

			baseline: 'BlocPacInfinite' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacResizable' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacScrollable' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacScripter' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];

			baseline: 'BrickCore' with: [
				self thisRepositoryFor: spec ];
			baseline: 'BrickEditor' with: [
				self thisRepositoryFor: spec ].
		spec 
			package: #Brick with: [
				spec requires: #(
					"#'PharoBootstrap' "
					#'BlocCore'
					#'BlocLayout'
					#'BlocText'
					
					#'BlocPacInfinite'
					#'BlocPacResizable'
					#'BlocPacScrollable'
					
					#'BrickCore'
					#'BrickEditor'). ];
			package: #'Brick-DevTool' with: [
				spec requires: #(#'Brick' #'BlocPacScripter'). ] ].
]
