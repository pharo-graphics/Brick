Class {
	#name : #BaselineOfBrickGlamorous,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickGlamorous
}

{ #category : #baseline }
BaselineOfBrickGlamorous >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		| repository |
		repository := self packageRepository description.
		spec
			"baseline: 'PharoBootstrap' with: [ spec loads: #(#'KernelGroup') ];
			baseline: 'Morphic' with: [ spec loads: #(#'Graphics-Files' ) ];
			baseline: 'Display' with: [ spec loads: #(#'Graphics-Display Objects' ) ];"

			baseline: 'BlocCore' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocAnimation' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocLayout' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocText' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];

			baseline: 'BlocPacAsyncElement' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacGeometry' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacOverlay' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacScalable' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];

			baseline: 'BrickCore' with: [
				spec repository: repository ];
			baseline: 'BrickWidgets' with: [
				spec repository: repository ];
			baseline: 'BrickEditor' with: [
				spec repository: repository ];
			
			baseline: 'GToolkitResourcesUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility/src' ].
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

{ #category : #'as yet unclassified' }
BaselineOfBrickGlamorous >> packageRepository [
	| theRepositories |
	theRepositories := self class package mcWorkingCopy repositoryGroup repositories.
	^ (theRepositories reject: [:each | each = MCCacheRepository uniqueInstance]) 
		ifNotEmpty: [ :repositories | repositories anyOne ]
		ifEmpty: [ (theRepositories select: [:each | each = MCCacheRepository uniqueInstance ])
			ifNotEmpty: [ :repositories | repositories anyOne ]
			ifEmpty: [ nil ] ]
]
