Class {
	#name : #BrGlamorousButtonLabelAndIconLook,
	#superclass : #BrGlamorousButtonLabelLook,
	#instVars : [
		'iconElement'
	],
	#category : #'Brick-Glamorous-Buttons - Support'
}

{ #category : #accessing }
BrGlamorousButtonLabelAndIconLook >> icon [
	<return: #BlElement>

	^ iconElement
]

{ #category : #accessing }
BrGlamorousButtonLabelAndIconLook >> icon: aStencilOrElement [
	self
		assert: [ aStencilOrElement isNotNil ]
		description: [ 'Icon must not be nil' ].

	iconElement := aStencilOrElement asElement.
	self updateIcon
]

{ #category : #enumerating }
BrGlamorousButtonLabelAndIconLook >> iconDo: aBlock [
	aBlock value: self icon
]

{ #category : #initialization }
BrGlamorousButtonLabelAndIconLook >> initialize [
	super initialize.

	"default icon"
	iconElement := BlElement new.
	iconElement size: 6 @ 6.
	iconElement background: Color red.
	iconElement geometry: BlEllipseGeometry new.
	self
		addChange:
			(BrLookChange new
				up: [ :e | self updateIcon ];
				down: [ :e | iconElement ifNotNil: #removeFromParent ];
				yourself)
]

{ #category : #initialization }
BrGlamorousButtonLabelAndIconLook >> initializeListeners [
	super initializeListeners.

	self when: BrIconChanged do: [ :anEvent | self icon: anEvent icon ]
]

{ #category : #initialization }
BrGlamorousButtonLabelAndIconLook >> initializeRequests [
	super initializeRequests.

	"Request to update an icon as soon as we are bound to the widget"
	self request: BrIconRequest new
]

{ #category : #updating }
BrGlamorousButtonLabelAndIconLook >> updateIcon [
	self widgetDo: [ self widgetContent
		childNamed: #icon
		ifFound: [ :anIconElement |
			| aParent anIndex |
			aParent := anIconElement parent.
			anIndex := aParent childIndexOf: anIconElement.
			anIconElement removeFromParent.
			iconElement removeFromParent.
			aParent addChild: iconElement at: anIndex as: #icon ]
		ifNone: [ self widgetContent addChild: iconElement as: #icon ] ]
]
