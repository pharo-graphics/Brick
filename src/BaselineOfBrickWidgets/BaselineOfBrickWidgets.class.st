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

			baseline: 'BrickCore' with: [
				spec repository: self repository ];
			baseline: 'BrickEditor' with: [
				spec repository: self repository ].
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

{ #category : #'private - baseline' }
BaselineOfBrickWidgets >> repository [
	^ self repositoryOf: self class default: nil
]

{ #category : #'private - baseline' }
BaselineOfBrickWidgets >> repository: aRepositoryString for: spec [	
	^ self class environment
		at: spec root className asSymbol
		ifPresent: [ :aBaselineClass | self repositoryOf: aBaselineClass default: aRepositoryString ]
		ifAbsent: [ aRepositoryString ]
]

{ #category : #'private - baseline' }
BaselineOfBrickWidgets >> repositoryOf: aBaselineClass default: aDefaultString [
	| theRepositories |
	
	theRepositories := aBaselineClass package mcWorkingCopy repositoryGroup repositories.
	^ (theRepositories select: [:each | each = MCCacheRepository uniqueInstance ])
		ifNotEmpty: [ :repositories | repositories anyOne description ]
		ifEmpty: [ (theRepositories reject: [:each | each = MCCacheRepository uniqueInstance]) 
			ifNotEmpty: [ :repositories | repositories anyOne description ]
			ifEmpty: [ aDefaultString ] ]
]
