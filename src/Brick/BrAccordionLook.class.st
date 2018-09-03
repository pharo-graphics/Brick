Class {
	#name : #BrAccordionLook,
	#superclass : #BrLook,
	#instVars : [
		'contentElement',
		'stencil'
	],
	#category : #'Brick-Accordion - Look'
}

{ #category : #hooks }
BrAccordionLook >> accordionCollapsed [
	contentElement ifNotNil: [ contentElement removeFromParent ]
]

{ #category : #hooks }
BrAccordionLook >> accordionExpanded [

	contentElement ifNil: [ contentElement := self stencil asElement ].
	contentElement removeFromParent.
	self widgetContent addChild: contentElement
]

{ #category : #initialization }
BrAccordionLook >> initialize [
	super initialize.
	
	stencil := BlElement new
]

{ #category : #initialization }
BrAccordionLook >> initializeListeners [
	super initializeListeners.

	self when: BrExpansionChanged do: [ :anEvent |
		anEvent isExpanded
			ifTrue: [ self accordionExpanded ]
			ifFalse: [ self accordionCollapsed ] ].
	self when: BrAccordionStencilChanged do: [ :anEvent | self stencil: anEvent stencil ]
]

{ #category : #initialization }
BrAccordionLook >> initializeLook [
	super initializeLook.
	
	
]

{ #category : #initialization }
BrAccordionLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrAccordionStencilRequest new.
	self request: BrExpandedRequest new
]

{ #category : #accessing }
BrAccordionLook >> stencil [
	 ^ stencil
]

{ #category : #accessing }
BrAccordionLook >> stencil: aBrStencil [

	self
		assert: [ aBrStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	stencil := aBrStencil asStencil.

	contentElement ifNotNil: [ contentElement removeFromParent ].
	contentElement := nil.
	self request: BrExpandedRequest new
]
