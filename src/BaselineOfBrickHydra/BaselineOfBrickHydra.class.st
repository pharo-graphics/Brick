Class {
	#name : #BaselineOfBrickHydra,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickHydra
}

{ #category : #baseline }
BaselineOfBrickHydra >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		| repository |
		repository := self packageRepository description.
		spec 
			"baseline: 'PharoBootstrap' with: [ spec loads: 'KernelGroup' ];"

			baseline: 'BlocCore' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocLayout' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			
			baseline: 'BrickCore' with: [
				spec repository: repository ];
			baseline: 'BrickWidgets' with: [
				spec repository: repository ].

		spec 
			package: #'Brick-Hydra' with: [
				spec requires: #(
					"#'PharoBootstrap'"
					
					#'BlocCore'
					#'BlocLayout'

					#'BrickCore'
					#'BrickWidgets') ]. ].
]

{ #category : #'as yet unclassified' }
BaselineOfBrickHydra >> packageRepository [
	| theRepositories |
	theRepositories := self class package mcWorkingCopy repositoryGroup repositories.
	^ (theRepositories reject: [:each | each = MCCacheRepository uniqueInstance]) 
		ifNotEmpty: [ :repositories | repositories anyOne ]
		ifEmpty: [ (theRepositories select: [:each | each = MCCacheRepository uniqueInstance ])
			ifNotEmpty: [ :repositories | repositories anyOne ]
			ifEmpty: [ nil ] ]
]
