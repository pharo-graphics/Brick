Class {
	#name : #BrGlamorousDropdownGeometry,
	#superclass : #BlGeometry,
	#instVars : [
		'cornerRadius',
		'toggleExtent'
	],
	#category : #'Brick-Glamorous-Dropdown'
}

{ #category : #'as yet unclassified' }
BrGlamorousDropdownGeometry >> buildPathOnSpartaCanvas: aCanvas [
	| bounds origin dropdownExtent path |
	bounds := self geometryBounds.
	origin := bounds origin.
	dropdownExtent := bounds extent - (0 @ toggleExtent y)
		max: toggleExtent x @ 0.
	path := aCanvas path.
	path
		moveTo: origin + (0 @ toggleExtent y);
		lineTo: origin + (0 @ cornerRadius);
		cwArcTo: origin + (cornerRadius @ 0);
		lineTo: origin + ((toggleExtent x - cornerRadius) @ 0);
		cwArcTo: origin + (toggleExtent x @ cornerRadius).
	dropdownExtent x - toggleExtent x >= (2 * cornerRadius)
		ifTrue: [ path
				lineTo: origin + (toggleExtent x @ (toggleExtent y - cornerRadius));
				ccwArcTo: origin + ((toggleExtent x + cornerRadius) @ toggleExtent y);
				lineTo: origin + ((dropdownExtent x - cornerRadius) @ toggleExtent y);
				cwArcTo: origin + (dropdownExtent x @ (toggleExtent y + cornerRadius)) ]
		ifFalse: [ path lineTo: origin + toggleExtent.
			dropdownExtent x - toggleExtent x >= cornerRadius
				ifTrue: [ path
						lineTo: origin + ((dropdownExtent x - cornerRadius) @ toggleExtent y);
						cwArcTo: origin + (dropdownExtent x @ (toggleExtent y + cornerRadius)) ]
				ifFalse: [ path lineTo: origin + (dropdownExtent x @ toggleExtent y) ] ].
	path
		lineTo:
			origin
				+
					(dropdownExtent x @ (dropdownExtent y + toggleExtent y - cornerRadius));
		cwArcTo:
			origin
				+
					((dropdownExtent x - cornerRadius)
						@ (dropdownExtent y + toggleExtent y));
		lineTo: origin + (cornerRadius @ (dropdownExtent y + toggleExtent y));
		cwArcTo: origin + (0 @ (dropdownExtent y + toggleExtent y - cornerRadius));
		lineTo: origin + (0 @ toggleExtent y).
	^ path build
]

{ #category : #accessing }
BrGlamorousDropdownGeometry >> cornerRadius [
	^ cornerRadius
]

{ #category : #accessing }
BrGlamorousDropdownGeometry >> cornerRadius: anObject [
	cornerRadius := anObject
]

{ #category : #initialization }
BrGlamorousDropdownGeometry >> initialize [
	super initialize.
	cornerRadius := 5.
	toggleExtent := 50 @ 20
]

{ #category : #geometry }
BrGlamorousDropdownGeometry >> matchExtent: aPoint [
	extent := aPoint
]

{ #category : #accessing }
BrGlamorousDropdownGeometry >> toggleExtent [
	^ toggleExtent
]

{ #category : #accessing }
BrGlamorousDropdownGeometry >> toggleExtent: anObject [
	toggleExtent := anObject
]
