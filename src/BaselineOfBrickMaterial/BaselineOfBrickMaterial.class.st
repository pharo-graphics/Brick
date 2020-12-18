Class {
	#name : #BaselineOfBrickMaterial,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickMaterial
}

{ #category : #baseline }
BaselineOfBrickMaterial >> baseline: spec [
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
			package: #'Brick-Material' with: [
				spec requires: #(
					"#'PharoBootstrap'"
					
					#'BlocCore'
					#'BlocLayout'
					
					#'BrickCore'
					#'BrickWidgets') ]. ].
]
