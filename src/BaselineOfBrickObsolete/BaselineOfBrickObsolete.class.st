Class {
	#name : #BaselineOfBrickObsolete,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickObsolete
}

{ #category : #baselines }
BaselineOfBrickObsolete >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec
		baseline: 'Brick' with: [ spec
			repository: 'github://pharo-graphics/Brick/src' ];
		
		"not used packages / to be removed"
		package: #'Brick-Style' with: [ spec requires: #('Brick'). ];
		package: #'Brick-UI' with: [ spec requires: #(#Brick). ];
		package: #'Brick-Sparta' with: [ spec requires: #(Brick). ];
		package: #'Brick-Experimental' with: [ spec requires: #('Brick-UI' 'Brick'). ]
	]
]
