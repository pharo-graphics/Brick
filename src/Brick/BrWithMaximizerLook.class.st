Class {
	#name : #BrWithMaximizerLook,
	#superclass : #BrLook,
	#traits : 'TBlElementQuery',
	#classTraits : 'TBlElementQuery classTrait',
	#instVars : [
		'isMaximized',
		'placeholderElement',
		'preferredBackground',
		'targetQuery'
	],
	#category : #'Brick-Maximizer - Look'
}

{ #category : #private }
BrWithMaximizerLook >> elementToMaximize [
	^ (targetQuery findOne: self widget) result
]

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
	preferredBackground := Color transparent.
	
	"empty selector, means we apply it on the widget itself"
	targetQuery := BlElementLazyQuery new
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
		| anElementToMaximize |
		
		anElementToMaximize := self elementToMaximize.
		anElementToMaximize
			ifNil: [ ^ self ].
		
		 (self findAllPossibleHostsFor: anElementToMaximize)
			ifNotEmpty: [ :theHosts | self maximizeElement: anElementToMaximize in: theHosts first ] ]
]

{ #category : #private }
BrWithMaximizerLook >> maximizeElement: anElementToMaximize in: aHostElement [
	"Maximization is impossible if an element has no parent"
	anElementToMaximize hasParent
		ifFalse: [ ^ self ].

	placeholderElement := BlElement new.
	placeholderElement constraints horizontal resizer: anElementToMaximize constraints horizontal resizer.
	placeholderElement constraints vertical resizer: anElementToMaximize constraints vertical resizer.
	
	anElementToMaximize parent replaceChild: anElementToMaximize with: placeholderElement.
	
	aHostElement dispatchEvent: (BrMaximizerMaximizeWish new
		maximizerLook: self;
		elementToMaximize: anElementToMaximize;
		preferredBackground: self preferredBackground).
	
	isMaximized := true.
	
	anElementToMaximize dispatchEvent: (BrMaximizerElementMaximized new
		hostElement: aHostElement;
		placeholderElement: placeholderElement).

	self onMaximized
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

{ #category : #'api - query' }
BrWithMaximizerLook >> queryStep: aBlElementStep [
	targetQuery queryStep: aBlElementStep
]
