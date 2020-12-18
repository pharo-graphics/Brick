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
				self repository: 'github://feenkcom/Bloc/src' for: self ];
			baseline: 'BlocLayout' with: [
				self repository: 'github://feenkcom/Bloc/src' for: self ];
			
			baseline: 'BrickCore' with: [
				self thisRepositoryFor: spec ];
			baseline: 'BrickWidgets' with: [
				self thisRepositoryFor: spec ].

		spec 
			package: #'Brick-Hydra' with: [
				spec requires: #(
					"#'PharoBootstrap'"
					
					#'BlocCore'
					#'BlocLayout'

					#'BrickCore'
					#'BrickWidgets') ]. ].
]
