Class {
	#name : #BaselineOfBrickOld,
	#superclass : #BaselineOf,
	#instVars : [
		'group'
	],
	#category : #BaselineOfBrickOld
}

{ #category : #baselines }
BaselineOfBrickOld >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
			preLoadDoIt:  #preLoadActions:;
		   baseline: 'Bloc' with: [ spec
				postLoadDoIt: #postLoadBloc:;
				loads: #(stub); "Stub does not load anything here. We load Bloc in postLoadBloc:"
				repository: 'github://feenkcom/Bloc/src' ];
			
			package: #'Brick' with: [ spec requires: #('Bloc') ];
			package: #'Brick-Editor' with: [ spec requires: #('Brick'). ];
			package: #'Brick-Editor-Extensions' with: [ spec requires: #('Brick' 'Brick-Editor'). ];
			package: #'Brick-Material' with: [ spec requires: #('Brick'). ];
			package: #'Brick-Hydra' with: [ spec requires: #('Brick'). ];
			package: #'Brick-Glamorous' with: [ spec requires: #('Brick'). ];
			package: #'Brick-Examples' with: [ spec requires: #('Brick' 'Brick-Material'). ];

			"not used packages / to be removed"
			package: #'Brick-Style' with: [ spec requires: #('Brick'). ];
			package: #'Brick-UI' with: [ spec requires: #(#Brick). ];
			package: #'Brick-Sparta' with: [ spec requires: #(Brick). ];
			package: #'Brick-Experimental' with: [ spec requires: #('Brick-UI' 'Brick-Material'). ];

			"default groups"
			group: 'default' with: #(
				'Brick'
				'Brick-Editor'
				'Brick-Editor-Extensions'
				'Brick-Material'
				'Brick-Glamorous'
				'Brick-Hydra'
				'Brick-Examples');

			group: 'stub' with: #() ]
]

{ #category : #accessing }
BaselineOfBrickOld >> directive [
	"Return current group's directive as symbol.
	For example if group is #'git:development' I return #'git' "
	<return: #Symbol>
	self
		assert: [ self hasDirective ]
		description: [ 'Group must have directive in order to query for it' ].
		
	^ (group first: (group indexOf: $:) - 1) asSymbol
]

{ #category : #accessing }
BaselineOfBrickOld >> group [
	"Return a loading group requested by user.
	Group is initialized during preLoadActions:"
	<return: #Symbol>
	
	^ group
]

{ #category : #private }
BaselineOfBrickOld >> groupOf: aSpecLoader [
	"Return a requested group to load. It may be prefixed with file: or git:"
	<return: #Symbol>

	^ (aSpecLoader spec required difference: aSpecLoader spec packages keys) asArray first asSymbol
]

{ #category : #testing }
BaselineOfBrickOld >> hasDirective [
	"Return true if there is a special directive defined by group prefix.
	For example if group is 'git:development', then directive is 'git' and I return true.
	If group is just 'core', which means there is no directive I return false"
	<return: #Boolean>
	
	^ (group indexOf: $:) > 0
]

{ #category : #actions }
BaselineOfBrickOld >> postLoadBloc: aSpecLoader [
	"Let Bloc load as it wish"

	Metacello new
		baseline: aSpecLoader spec name;
		repository: aSpecLoader spec repositories map keys first;
		load: self group
]

{ #category : #actions }
BaselineOfBrickOld >> preLoadActions: aSpecLoader [
	"Extract requested group from spec loader to work with during loading"

	group := self groupOf: aSpecLoader
]

{ #category : #accessing }
BaselineOfBrickOld >> target [
	"Return current group's target as symbol.
	For example if group is #'git:development' I return #'development'"
	<return: #Symbol>
		
	^ (group last: group size - (group indexOf: $:)) asSymbol
]
