Class {
	#name : #BrWithMaximizerAptitude,
	#superclass : #BrAptitude,
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
BrWithMaximizerAptitude >> elementToMaximize [
	^ (targetQuery findOne: self widget) result
]

{ #category : #private }
BrWithMaximizerAptitude >> findAllPossibleHostsFor: anElement [
	"Given an element return a collection of all possible maximization hosts in the bottom-to-top order.
	A maximization host is an element that that has ${class:BrMaximizerHostLook}$ or is a space root"
	<return: #Collection of: #BlElement>
	
	^ Array streamContents: [ :aStream | anElement allParentsDo: [ :eachParent |
		| hasHostLook |
		hasHostLook := false.
		eachParent aptitudeDo: [ :eachParentLook | hasHostLook := eachParentLook hasActorOfKind: BrMaximizerHostAptitude ].
		hasHostLook
			ifTrue: [ aStream nextPut: eachParent ] ] ]
]

{ #category : #initialization }
BrWithMaximizerAptitude >> initialize [
	super initialize.
	
	isMaximized := false.
	preferredBackground := Color transparent.
	
	"empty selector, means we apply it on the widget itself"
	targetQuery := BlElementLazyQuery new
]

{ #category : #initialization }
BrWithMaximizerAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrMaximizerMinimizeWish do: [ :anEvent |
		self
			minimizeElement: anEvent elementToMinimize
			in: anEvent hostElement ]
]

{ #category : #accessing }
BrWithMaximizerAptitude >> isMaximized [
	^ isMaximized
]

{ #category : #'api - maximization' }
BrWithMaximizerAptitude >> maximize [
	self widgetDo: [ :anElement |
		| anElementToMaximize |
		
		anElementToMaximize := self elementToMaximize.
		anElementToMaximize
			ifNil: [ ^ self ].
		
		 (self findAllPossibleHostsFor: anElementToMaximize)
			ifNotEmpty: [ :theHosts | self maximizeElement: anElementToMaximize in: theHosts first ] ]
]

{ #category : #private }
BrWithMaximizerAptitude >> maximizeElement: anElementToMaximize in: aHostElement [
	"Maximization is impossible if an element has no parent"
	anElementToMaximize hasParent
		ifFalse: [ ^ self ].

	placeholderElement := BlElement new.
	placeholderElement constraints horizontal resizer: anElementToMaximize constraints horizontal resizer.
	placeholderElement constraints vertical resizer: anElementToMaximize constraints vertical resizer.
	
	anElementToMaximize parent replaceChild: anElementToMaximize with: placeholderElement.
	
	aHostElement dispatchEvent: (BrMaximizerMaximizeWish new
		maximizerAptitude: self;
		elementToMaximize: anElementToMaximize;
		preferredBackground: self preferredBackground).
	
	isMaximized := true.
	
	anElementToMaximize dispatchEvent: (BrMaximizerElementMaximized new
		hostElement: aHostElement;
		placeholderElement: placeholderElement).

	self onMaximized
]

{ #category : #private }
BrWithMaximizerAptitude >> minimizeElement: anElement in: aHostElement [
	
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
BrWithMaximizerAptitude >> onMaximized [
]

{ #category : #'private - hooks' }
BrWithMaximizerAptitude >> onMinimized [
]

{ #category : #accessing }
BrWithMaximizerAptitude >> preferredBackground [
	^ preferredBackground
]

{ #category : #accessing }
BrWithMaximizerAptitude >> preferredBackground: anObject [
	preferredBackground := anObject
]

{ #category : #'api - query' }
BrWithMaximizerAptitude >> queryStep: aBlElementStep [
	targetQuery queryStep: aBlElementStep
]
