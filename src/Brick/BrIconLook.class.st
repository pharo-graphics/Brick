"
I add an icon to the widget content. An icon can be any ==BlElement==.

Icon look supports automatic icon property binding to the view model.
For that a view model must respond to the ==BrIconRequest== and reply with a corresponding ==BrIconChanged== event.

For example in a subclass of a ViewModel override ==#onAttachedTo:== and implement:
[[[
	self when: BrIconRequest reply: [ BrIconChanged new icon: self icon ].
]]]
"
Class {
	#name : #BrIconLook,
	#superclass : #BrLook,
	#instVars : [
		'iconElement'
	],
	#category : #'Brick-! Core - Looks'
}

{ #category : #accessing }
BrIconLook >> icon [
	<return: #BlElement>

	^ iconElement
]

{ #category : #accessing }
BrIconLook >> icon: aStencilOrElement [
	self
		assert: [ aStencilOrElement isNotNil ]
		description: [ 'Icon must not be nil' ].

	iconElement := aStencilOrElement asElement.
	self updateIcon
]

{ #category : #accessing }
BrIconLook >> iconDo: aBlock [
	aBlock value: self icon
]

{ #category : #initialization }
BrIconLook >> initialize [
	super initialize.

	"default icon"
	iconElement := BlElement new.
	iconElement size: 6 @ 6.
	iconElement background: Color red.
	iconElement geometry: BlEllipse new.
	self
		addChange:
			(BrLookChange new
				up: [ :e | self updateIcon ];
				down: [ :e | iconElement ifNotNil: #removeFromParent ];
				yourself)
]

{ #category : #initialization }
BrIconLook >> initializeListeners [
	super initializeListeners.

	self when: BrIconChanged do: [ :anEvent | self icon: anEvent icon ]
]

{ #category : #initialization }
BrIconLook >> initializeRequests [
	super initializeRequests.

	"Request to update an icon as soon as we are bound to the widget"
	self request: BrIconRequest new
]

{ #category : #updating }
BrIconLook >> updateIcon [
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
