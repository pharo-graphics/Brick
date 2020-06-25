"
I represent a single line of a flow layout.

I store reference to the next line in order to avoid unnecessary array of lines creation for a very common case of just one line
"
Class {
	#name : #BrEditorTextFlowLine,
	#superclass : #Object,
	#instVars : [
		'elements',
		'maxWidth',
		'availableWidth',
		'nextLine',
		'width',
		'height',
		'pushedQueue',
		'origin',
		'baseline'
	],
	#category : #'Brick-Editor-Layout'
}

{ #category : #adding }
BrEditorTextFlowLine >> add: anElement [
	"Try to assign a given element to this line (if possible) or create a new line.
	Return a line to which next element should be tried to added"
	<return: #BrEditorTextFlowLine>
	| currentLine |
	
	anElement constraints textFlow shouldPushLine
		ifTrue: [
			pushedQueue addLast: anElement.
			^ self ].
	
	currentLine := ((self hasSpaceFor: anElement) and: [ anElement constraints textFlow shouldBreakLineBefore not ])
		ifTrue: [ self push: anElement ]
		ifFalse: [ self nextLine push: anElement ].
		
	^ anElement constraints textFlow shouldBreakLineAfter
		ifTrue: [ currentLine nextLine ]
		ifFalse: [ currentLine ]
]

{ #category : #accessing }
BrEditorTextFlowLine >> baseline [
	^ baseline
]

{ #category : #accessing }
BrEditorTextFlowLine >> count [
	"Return how many lines there are in total"
	<return: #Number>
	
	^ 1 + (self hasNextLine
		ifTrue: [ self nextLine count ]
		ifFalse: [ 0 ])
]

{ #category : #geometry }
BrEditorTextFlowLine >> distanceTo: aPoint [
	"Compute the vertical distance from me to a given point"
	<return: #Number>
	| aClampedCoordinate |
	
	aClampedCoordinate := (aPoint y min: (self origin y + self height)) max: self origin y.
	
	^ (aPoint y - aClampedCoordinate) abs
]

{ #category : #enumerating }
BrEditorTextFlowLine >> do: aBlock [
	"Evaluate aBlock with each of my next lines as the argument"

	aBlock value: self.
	self hasNextLine
		ifTrue: [ nextLine do: aBlock ]
]

{ #category : #accessing }
BrEditorTextFlowLine >> elements [
	"Return a collection of all elements assigned to this line"
	<return: #OrderedCollection>

	^ elements
]

{ #category : #geometry }
BrEditorTextFlowLine >> findClosestElementTo: aPoint [
	<return: #BlElement>
	| aClosestElement aClosestDistance |
	
	aClosestElement := elements first.
	aClosestDistance := aClosestElement distanceToX: aPoint.
	
	elements do: [ :eachElement | 
		| eachDistance |
		
		eachDistance := eachElement distanceToX: aPoint.
		eachDistance < aClosestDistance
			ifTrue: [
				aClosestDistance := eachDistance.
				aClosestElement := eachElement ] ].
		
	^ aClosestElement
]

{ #category : #testing }
BrEditorTextFlowLine >> hasNextLine [
	"Return true if there is a next line, false otherwise"
	<return: #Boolean>
	
	^ nextLine isNotNil
]

{ #category : #testing }
BrEditorTextFlowLine >> hasSpaceFor: anElement [
	"Return true if I am able to provide space for a given element.
	By convention I always allow element to take space if I am empty
	regardless of actual available space"
	<return: #Boolean>
	
	^ self isEmpty or: [
		| aChildWidth |
		
		aChildWidth := anElement measuredWidth + anElement margin width.
		
		"we can not directly return the comparison, because it is possible that available width
		is very very close but slightly less than (by a thousand of a pixel) the child's measured width."
		availableWidth >= aChildWidth
			ifTrue: [ true ]
			ifFalse: [ availableWidth closeTo: aChildWidth epsilon: 0.5 ] ]
]

{ #category : #geometry }
BrEditorTextFlowLine >> height [
	"Return my height which is equal to the height of the highest element"
	<return: #Number>

	^ height
]

{ #category : #initialization }
BrEditorTextFlowLine >> initialize [
	super initialize.
	
	self reset
]

{ #category : #testing }
BrEditorTextFlowLine >> isEmpty [
	"Return true if I am an empty line without any element, false otherwise"
	<return: #Boolean>

	^ elements isEmpty
]

{ #category : #accessing }
BrEditorTextFlowLine >> maxWidth [
	"Return maximal width limit for the current line"
	<return: #Number>

	^ maxWidth
]

{ #category : #accessing }
BrEditorTextFlowLine >> maxWidth: aNumber [
	"Limit maximal width to the given number"

	maxWidth := aNumber.
	availableWidth := maxWidth - width
]

{ #category : #accessing }
BrEditorTextFlowLine >> nextLine [
	"Return or create a new next line to which we should continue adding elements"
	<return: #BrEditorTextFlowLine>

	^ nextLine ifNil: [
		nextLine := BrEditorTextFlowLine new
			maxWidth: maxWidth;
			pushedQueue: pushedQueue;
			yourself ]
]

{ #category : #accessing }
BrEditorTextFlowLine >> origin [
	<return: #Point>

	^ origin
]

{ #category : #accessing }
BrEditorTextFlowLine >> origin: aPoint [
	origin := aPoint
]

{ #category : #private }
BrEditorTextFlowLine >> push: anElement [
	"Push pushes given element to the end of element's collection
	and update my geometry properties taking new element into account "

	elements addLast: anElement.

	width := width + (anElement measuredWidth + anElement margin width).
	height := height max: (anElement measuredHeight + anElement margin height).
	availableWidth := maxWidth - width.
	
	baseline := baseline max: (anElement baselineOffset + anElement margin top)
]

{ #category : #accessing }
BrEditorTextFlowLine >> pushedQueue [
	^ pushedQueue
]

{ #category : #accessing }
BrEditorTextFlowLine >> pushedQueue: aQueue [
	pushedQueue := aQueue
]

{ #category : #initialization }
BrEditorTextFlowLine >> reset [
	maxWidth := Float infinity.
	width := 0.
	height := 0.
	origin := 0@0.
	baseline := 0.
	availableWidth := maxWidth.
	elements := OrderedCollection new.
	pushedQueue := LinkedList new.
	
	nextLine ifNotNil: [ :aNextLine | aNextLine reset ].
	nextLine := nil
]

{ #category : #geometry }
BrEditorTextFlowLine >> totalHeight [
	"Return a total height taking into account all next lines"
	<return: #Number>
	| aTotalHeight |
	
	aTotalHeight := self hasNextLine
		ifTrue: [ nextLine totalHeight ]
		ifFalse: [ 0 ].
	
	^ self height + aTotalHeight
]

{ #category : #geometry }
BrEditorTextFlowLine >> totalWidth [
	"Return a total width taking into account all next lines"
	<return: #Number>
	| aTotalWidth |
	
	aTotalWidth := self hasNextLine
		ifTrue: [ nextLine totalWidth ]
		ifFalse: [ 0 ].
	
	^ self width max: aTotalWidth
]

{ #category : #geometry }
BrEditorTextFlowLine >> width [
	"Return my width which is a sum of widths of all my elements"
	<return: #Number>

	^ width
]
