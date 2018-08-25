"
I am a Baseline of Brick.
"
Class {
	#name : #BaselineOfBrick,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrick
}

{ #category : #baselines }
BaselineOfBrick >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		baseline: 'Bloc' with: [ spec
			repository: 'github://pharo-graphics/Bloc/src' ];
			
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
		package: #'Brick-Experimental' with: [ spec requires: #('Brick-UI' 'Brick-Material'). ]
	]
]
