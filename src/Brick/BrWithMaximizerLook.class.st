Class {
	#name : #BrWithMaximizerLook,
	#superclass : #BrLook,
	#instVars : [
		'isMaximized',
		'placeholderElement',
		'preferredBackground'
	],
	#category : #'Brick-Maximizer - Look'
}

{ #category : #private }
BrWithMaximizerLook >> findAllPossibleHostsFor: anElement [
	"Given an element return a collection of all possible maximization hosts in the bottom-to-top order.
	A maximization host is an element that that has ${class:BrMaximizerHostLook}$ or is a space root"
	<return: #Collection of: #BlElement>
	
	^ Array streamContents: [ :aStream | anElement allParentsDo: [ :eachParent |
		| hasHostLook |
		hasHostLook := false.
		eachParent lookDo: [ :eachParentLook | hasHostLook := eachParentLook hasActorOfKind: BrMaximizerHostLook ].
		hasHostLook
			ifTrue: [ aStream nextPut: eachParent ] ] ]
]

{ #category : #initialization }
BrWithMaximizerLook >> initialize [
	super initialize.
	
	isMaximized := false.
	preferredBackground := Color transparent
]

{ #category : #initialization }
BrWithMaximizerLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrMaximizerMinimizeWish do: [ :anEvent |
		self
			minimizeElement: anEvent elementToMinimize
			in: anEvent hostElement ]
]

{ #category : #accessing }
BrWithMaximizerLook >> isMaximized [
	^ isMaximized
]

{ #category : #'api - maximization' }
BrWithMaximizerLook >> maximize [
	self widgetDo: [ :anElement |
		 (self findAllPossibleHostsFor: anElement)
			ifNotEmpty: [ :theHosts | self maximizeElement: anElement in: theHosts first ] ]
]

{ #category : #private }
BrWithMaximizerLook >> maximizeElement: anElement in: aHostElement [
	"Maximization is impossible if an element has no parent"
	anElement hasParent
		ifFalse: [ ^ self ].

	placeholderElement := BlElement new.
	placeholderElement constraints horizontal resizer: anElement constraints horizontal resizer.
	placeholderElement constraints vertical resizer: anElement constraints vertical resizer.
	
	anElement parent replaceChild: anElement with: placeholderElement.
	
	aHostElement dispatchEvent: (BrMaximizerMaximizeWish new
		elementToMaximize: anElement;
		preferredBackground: self preferredBackground).
	
	isMaximized := true.
	
	anElement dispatchEvent: (BrMaximizerElementMaximized new
		hostElement: aHostElement;
		placeholderElement: placeholderElement).
		
	self onMaximized
]

{ #category : #'api - maximization' }
BrWithMaximizerLook >> maximizeIn: aHostElement [
	isMaximized
		ifTrue: [ ^ self ].

	self widgetDo: [ :anElement |
		anElement hasParent
			ifFalse: [ ^ self ].
	
		self maximizeElement: anElement in: aHostElement ]
]

{ #category : #'api - maximization' }
BrWithMaximizerLook >> minimize [
	isMaximized
		ifFalse: [ ^ self ].

	self widgetDo: [ :anElement |
		anElement hasParent
			ifFalse: [ ^ self ].
		self
			minimizeElement: anElement
			in: anElement parent ]
]

{ #category : #private }
BrWithMaximizerLook >> minimizeElement: anElement in: aHostElement [
	
	self
		assert: [ placeholderElement notNil ]
		description: [ 'Placeholder element must exist' ].

	placeholderElement parent replaceChild: placeholderElement with: anElement.
	
	anElement dispatchEvent: (BrMaximizerElementMinimized new
		hostElement: aHostElement;
		placeholderElement: placeholderElement).

	placeholderElement := nil.
	isMaximized := false.
	
	self onMinimized
]

{ #category : #'private - hooks' }
BrWithMaximizerLook >> onMaximized [
]

{ #category : #'private - hooks' }
BrWithMaximizerLook >> onMinimized [
]

{ #category : #accessing }
BrWithMaximizerLook >> preferredBackground [
	^ preferredBackground
]

{ #category : #accessing }
BrWithMaximizerLook >> preferredBackground: anObject [
	preferredBackground := anObject
]
