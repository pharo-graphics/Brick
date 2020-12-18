Class {
	#name : #BaselineOfBrickGlamorous,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickGlamorous
}

{ #category : #baseline }
BaselineOfBrickGlamorous >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			"baseline: 'PharoBootstrap' with: [ spec loads: #(#'KernelGroup') ];
			baseline: 'Morphic' with: [ spec loads: #(#'Graphics-Files' ) ];
			baseline: 'Display' with: [ spec loads: #(#'Graphics-Display Objects' ) ];"

			baseline: 'BlocCore' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			baseline: 'BlocAnimation' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			baseline: 'BlocLayout' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			baseline: 'BlocText' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];

			baseline: 'BlocPacAsyncElement' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacGeometry' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacOverlay' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacScalable' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];

			baseline: 'BrickCore' with: [
				self thisRepositoryFor: spec ];
			baseline: 'BrickWidgets' with: [
				self thisRepositoryFor: spec ];
			baseline: 'BrickEditor' with: [
				self thisRepositoryFor: spec ];
			
			baseline: 'GToolkitResourcesUtility' with: [
				self repository: 'github://feenkcom/gtoolkit-utility/src' for: self ].
		spec 
			package: #'Brick-Glamorous' with: [
				spec requires: #(
					"#'PharoBootstrap'
					#'Morphic'
					#'Display'"
					
					#'BlocCore'
					#'BlocAnimation'
					#'BlocLayout'
					#'BlocText'
					
					#'BlocPacAsyncElement'
					#'BlocPacGeometry'
					#'BlocPacOverlay'
					#'BlocPacScalable'
					
					#'BrickCore'
					#'BrickWidgets'
					#'BrickEditor'
					
					#'GToolkitResourcesUtility') ]. ].
]
