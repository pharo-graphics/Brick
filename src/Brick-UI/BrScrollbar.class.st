Class {
	#name : #BrScrollbar,
	#superclass : #BrWidget,
	#instVars : [
		'scrollValue',
		'min',
		'max',
		'unitIncrement',
		'blockIncrement',
		'visibleAmount',
		'orientation',
		'withButtons'
	],
	#category : 'Brick-UI-Scrollbar'
}

{ #category : #'as yet unclassified' }
BrScrollbar class >> horizontal [
	^ self basicNew
		beHorizontal;
		initialize;
		yourself
]

{ #category : #'as yet unclassified' }
BrScrollbar class >> vertical [
	^ self basicNew
		beVertical;
		initialize;
		yourself
]

{ #category : #accessing }
BrScrollbar >> adjustValue: aPosition [
	| posValue newValue |
	newValue := self scrollValue.
	posValue := (aPosition min: 1 max: 0) * (self max - self min).
	
	posValue > self scrollValue
		ifTrue: [ newValue := self scrollValue + self blockIncrement ].
	posValue < self scrollValue
		ifTrue: [ newValue := self scrollValue - self blockIncrement ].
	

	self scrollValue: (newValue min: self max max: self min)
]

{ #category : #orientation }
BrScrollbar >> beHorizontal [
	self orientation: BrScrollbarHorizontal new
]

{ #category : #orientation }
BrScrollbar >> beVertical [
	self orientation: BrScrollbarVertical new
]

{ #category : #accessing }
BrScrollbar >> blockIncrement [
	^ self blockIncrementProperty value
]

{ #category : #accessing }
BrScrollbar >> blockIncrement: anObject [
	self blockIncrementProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollbar >> blockIncrementProperty [
	^ blockIncrement
		ifNil: [ blockIncrement := BlObjectProperty on: self named: #blockIncrement default: 10 ]
]

{ #category : #accessing }
BrScrollbar >> decrement [
	self scrollValue: (self scrollValue - self blockIncrement min: self max max: self min)
]

{ #category : #'initialize-release' }
BrScrollbar >> defaultController [
	^ BrScrollbarController new 
]

{ #category : #'initialize-release' }
BrScrollbar >> defaultSkin [
	^ BrScrollbarSkin new
]

{ #category : #accessing }
BrScrollbar >> increment [
	self scrollValue: (self scrollValue + self blockIncrement min: self max max: self min)
]

{ #category : #accessing }
BrScrollbar >> max [
	^ self maxProperty value
]

{ #category : #accessing }
BrScrollbar >> max: aNumber [
	self maxProperty value: aNumber 
]

{ #category : #'accessing properties' }
BrScrollbar >> maxProperty [
	^ max ifNil: [ max := BlObjectProperty on: self named: #max default: 100 ]
]

{ #category : #accessing }
BrScrollbar >> min [
	^ self minProperty value
]

{ #category : #accessing }
BrScrollbar >> min: aNumber [
	self minProperty value: aNumber
]

{ #category : #'accessing properties' }
BrScrollbar >> minProperty [
	^ min ifNil: [ min := BlObjectProperty on: self named: #min default: 0 ]
]

{ #category : #accessing }
BrScrollbar >> orientation [
	^ self orientationProperty value
]

{ #category : #accessing }
BrScrollbar >> orientation: anObject [
	self orientationProperty value: anObject
]

{ #category : #'accessing properties' }
BrScrollbar >> orientationProperty [
	^ orientation 
		ifNil: [ orientation := BlObjectProperty on: self named: #orientation ]
]

{ #category : #accessing }
BrScrollbar >> scrollValue [
	^ self scrollValueProperty value
]

{ #category : #accessing }
BrScrollbar >> scrollValue: aNumber [
	self scrollValueProperty value: aNumber
]

{ #category : #'accessing properties' }
BrScrollbar >> scrollValueProperty [
	^ scrollValue 
		ifNil: [ scrollValue := BlObjectProperty on: self named: #scrollValue default:0 ]
]

{ #category : #accessing }
BrScrollbar >> unitIncrement [
	^ self unitIncrementProperty value
]

{ #category : #accessing }
BrScrollbar >> unitIncrement: aNumber [
	self unitIncrementProperty value: aNumber
]

{ #category : #'accessing properties' }
BrScrollbar >> unitIncrementProperty [
	^ unitIncrement 
		ifNil: [ unitIncrement := BlObjectProperty on: self named: #unitIncrement default: 1]
]

{ #category : #accessing }
BrScrollbar >> visibleAmount [
	^ self visibleAmountProperty value
]

{ #category : #accessing }
BrScrollbar >> visibleAmount: aNumber [
	self visibleAmountProperty value: aNumber
]

{ #category : #'accessing properties' }
BrScrollbar >> visibleAmountProperty [
	^ visibleAmount
		ifNil: [ visibleAmount := BlObjectProperty on: self named: #visibleAmount default: 15 ]
]

{ #category : #accessing }
BrScrollbar >> withButtons [
	^ self withButtonsProperty value
]

{ #category : #accessing }
BrScrollbar >> withButtons: aBoolean [
	self withButtonsProperty value: aBoolean
]

{ #category : #'accessing properties' }
BrScrollbar >> withButtonsProperty [
	^ withButtons
		ifNil: [ withButtons := BlObjectProperty on: self named: #withButtons default: true ]
]
