Class {
	#name : #BrEditorTextFlowNodeBasedLine,
	#superclass : #Object,
	#instVars : [
		'nodes',
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
BrEditorTextFlowNodeBasedLine >> add: aLayoutNode [
	"Try to assign a given element to this line (if possible) or create a new line.
	Return a line to which next element should be tried to added"
	<return: #BrEditorTextFlowLine>
	| currentLine |
	
	aLayoutNode constraints textFlow shouldPushLine
		ifTrue: [
			pushedQueue addLast: aLayoutNode.
			^ self ].
	
	currentLine := ((self hasSpaceFor: aLayoutNode) and: [ aLayoutNode constraints textFlow shouldBreakLineBefore not ])
		ifTrue: [ self push: aLayoutNode ]
		ifFalse: [ self nextLine push: aLayoutNode ].
		
	^ aLayoutNode constraints textFlow shouldBreakLineAfter
		ifTrue: [ currentLine nextLine ]
		ifFalse: [ currentLine ]
]

{ #category : #accessing }
BrEditorTextFlowNodeBasedLine >> baseline [
	^ baseline
]

{ #category : #accessing }
BrEditorTextFlowNodeBasedLine >> count [
	"Return how many lines there are in total"
	<return: #Number>
	
	^ 1 + (self hasNextLine
		ifTrue: [ self nextLine count ]
		ifFalse: [ 0 ])
]

{ #category : #geometry }
BrEditorTextFlowNodeBasedLine >> distanceTo: aPoint [
	"Compute the vertical distance from me to a given point"
	<return: #Number>
	| aClampedCoordinate |
	
	aClampedCoordinate := (aPoint y min: (self origin y + self height)) max: self origin y.
	
	^ (aPoint y - aClampedCoordinate) abs
]

{ #category : #enumerating }
BrEditorTextFlowNodeBasedLine >> do: aBlock [
	"Evaluate aBlock with each of my next lines as the argument"

	aBlock value: self.
	self hasNextLine
		ifTrue: [ nextLine do: aBlock ]
]

{ #category : #accessing }
BrEditorTextFlowNodeBasedLine >> elements [
	"Return a collection of all elements assigned to this line"
	<return: #OrderedCollection>

	^ nodes
]

{ #category : #geometry }
BrEditorTextFlowNodeBasedLine >> findClosestChildOf: anElement to: aPoint [
	<return: #BlElement>
	
	"otherwise compute based on the assigned line"
	^ self
		findClosestElementTo: aPoint
		in: (anElement children select: [ :eachChild | eachChild constraints textFlow assignedLine = self ])
]

{ #category : #geometry }
BrEditorTextFlowNodeBasedLine >> findClosestElementTo: aPoint in: aCollectionOfElements [
	<return: #BlElement>
	| aClosestElement aClosestDistance |
	
	aClosestElement := aCollectionOfElements first.
	aClosestDistance := aClosestElement distanceToX: aPoint.
	
	aCollectionOfElements do: [ :eachElement | 
		| eachDistance |
		
		eachDistance := eachElement distanceToX: aPoint.
		eachDistance < aClosestDistance
			ifTrue: [
				aClosestDistance := eachDistance.
				aClosestElement := eachElement ] ].

	^ aClosestElement
]

{ #category : #testing }
BrEditorTextFlowNodeBasedLine >> hasNextLine [
	"Return true if there is a next line, false otherwise"
	<return: #Boolean>
	
	^ nextLine isNotNil
]

{ #category : #testing }
BrEditorTextFlowNodeBasedLine >> hasSpaceFor: aLayoutNode [
	"Return true if I am able to provide space for a given layout node.
	By convention I always allow one node to take space if I am empty
	regardless of actual available space"
	<return: #Boolean>
	
	^ self isEmpty or: [
		| aChildWidth |

		aChildWidth := aLayoutNode width + aLayoutNode margin width.

		"we can not directly return the comparison, because it is possible that available width
		is very very close but slightly less than (by a thousand of a pixel) the child's measured width."
		availableWidth >= aChildWidth
			ifTrue: [ true ]
			ifFalse: [ availableWidth closeTo: aChildWidth epsilon: 0.5 ] ]
]

{ #category : #geometry }
BrEditorTextFlowNodeBasedLine >> height [
	"Return my height which is equal to the height of the highest element"
	<return: #Number>

	^ height
]

{ #category : #initialization }
BrEditorTextFlowNodeBasedLine >> initialize [
	super initialize.
	
	maxWidth := Float infinity.
	width := 0.
	height := 0.
	origin := 0@0.
	baseline := 0.
	availableWidth := maxWidth.

	nodes := OrderedCollection new.
	pushedQueue := LinkedList new.

	nextLine := nil
]

{ #category : #testing }
BrEditorTextFlowNodeBasedLine >> isEmpty [
	"Return true if I am an empty line without any element, false otherwise"
	<return: #Boolean>

	^ nodes isEmpty
]

{ #category : #accessing }
BrEditorTextFlowNodeBasedLine >> maxWidth [
	"Return maximal width limit for the current line"
	<return: #Number>

	^ maxWidth
]

{ #category : #accessing }
BrEditorTextFlowNodeBasedLine >> maxWidth: aNumber [
	"Limit maximal width to the given number"

	maxWidth := aNumber.
	availableWidth := maxWidth - width
]

{ #category : #accessing }
BrEditorTextFlowNodeBasedLine >> nextLine [
	"Return or create a new next line to which we should continue adding elements"
	<return: #BrEditorTextFlowLine>

	^ nextLine ifNil: [
		nextLine := BrEditorTextFlowLine new
			maxWidth: maxWidth;
			pushedQueue: pushedQueue;
			yourself ]
]

{ #category : #accessing }
BrEditorTextFlowNodeBasedLine >> origin [
	<return: #Point>

	^ origin
]

{ #category : #accessing }
BrEditorTextFlowNodeBasedLine >> origin: aPoint [
	origin := aPoint
]

{ #category : #private }
BrEditorTextFlowNodeBasedLine >> push: aLayoutNode [
	"Push pushes given element to the end of element's collection
	and update my geometry properties taking new element into account "

	nodes addLast: aLayoutNode.
	aLayoutNode constraints textFlow assignToLine: self.

	width := width + (aLayoutNode width + aLayoutNode margin width).
	height := height max: (aLayoutNode height + aLayoutNode margin height).
	availableWidth := maxWidth - width.
	
	baseline := baseline max: ("aLayoutNode baselineOffset + "aLayoutNode margin top)
]

{ #category : #accessing }
BrEditorTextFlowNodeBasedLine >> pushedQueue [
	^ pushedQueue
]

{ #category : #accessing }
BrEditorTextFlowNodeBasedLine >> pushedQueue: aQueue [
	pushedQueue := aQueue
]

{ #category : #geometry }
BrEditorTextFlowNodeBasedLine >> totalHeight [
	"Return a total height taking into account all next lines"
	<return: #Number>
	| aTotalHeight |
	
	aTotalHeight := self hasNextLine
		ifTrue: [ nextLine totalHeight ]
		ifFalse: [ 0 ].
	
	^ self height + aTotalHeight
]

{ #category : #geometry }
BrEditorTextFlowNodeBasedLine >> totalWidth [
	"Return a total width taking into account all next lines"
	<return: #Number>
	| aTotalWidth |
	
	aTotalWidth := self hasNextLine
		ifTrue: [ nextLine totalWidth ]
		ifFalse: [ 0 ].
	
	^ self width max: aTotalWidth
]

{ #category : #geometry }
BrEditorTextFlowNodeBasedLine >> width [
	"Return my width which is a sum of widths of all my elements"
	<return: #Number>

	^ width
]
