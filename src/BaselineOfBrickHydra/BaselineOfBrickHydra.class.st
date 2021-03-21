Class {
	#name : #BaselineOfBrickHydra,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickHydra
}

{ #category : #baseline }
BaselineOfBrickHydra >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			"baseline: 'PharoBootstrap' with: [ spec loads: 'KernelGroup' ];"

			baseline: 'BlocCore' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocLayout' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			
			baseline: 'BrickCore' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickWidgets' with: [
				spec repository: 'github://feenkcom/Brick/src' ].

		spec 
			package: #'Brick-Hydra' with: [
				spec requires: #(
					"#'PharoBootstrap'"
					
					#'BlocCore'
					#'BlocLayout'

					#'BrickCore'
					#'BrickWidgets') ]. ].
]
