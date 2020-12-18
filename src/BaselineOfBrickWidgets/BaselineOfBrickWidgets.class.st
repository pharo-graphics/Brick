Class {
	#name : #BaselineOfBrickWidgets,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickWidgets
}

{ #category : #baseline }
BaselineOfBrickWidgets >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		| repository |
		repository := self packageRepository description.
		spec 
			"baseline: 'PharoBootstrap' with: [
				spec
					repository: '';
					loads: 'KernelGroup' ];"
			
			baseline: 'BlocCore' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocLayout' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocText' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			
			baseline: 'BlocPacInfinite' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacResizable' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacScrollable' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];

			baseline: 'BrickCore' with: [
				spec repository: repository ];
			baseline: 'BrickEditor' with: [
				spec repository: repository ].
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
				spec requires: #(#'Brick'). ] ].
]

{ #category : #'as yet unclassified' }
BaselineOfBrickWidgets >> packageRepository [
	| theRepositories |
	theRepositories := self class package mcWorkingCopy repositoryGroup repositories.
	^ (theRepositories reject: [:each | each = MCCacheRepository uniqueInstance]) 
		ifNotEmpty: [ :repositories | repositories anyOne ]
		ifEmpty: [ (theRepositories select: [:each | each = MCCacheRepository uniqueInstance ])
			ifNotEmpty: [ :repositories | repositories anyOne ]
			ifEmpty: [ nil ] ]
]
