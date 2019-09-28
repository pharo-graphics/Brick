Class {
	#name : #BrSelectionModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'selection'
	],
	#category : 'Brick-! Core'
}

{ #category : #printing }
BrSelectionModel class >> modelName [
	^ 'Selection'
]

{ #category : #'api - testing' }
BrSelectionModel >> contains: anIndex [
	"Return true if item at a given index is selected, false otherwise"
	<return: #Boolean>

	^ selection contains: anIndex
]

{ #category : #'api - selection' }
BrSelectionModel >> deselect: aFromIndex to: aToIndex [
	"Deselect items within a given interval"

	selection deselect: aFromIndex to: aToIndex.
	self notifyDeselected: (aFromIndex to: aToIndex)
]

{ #category : #'api - selection' }
BrSelectionModel >> deselectAll [
	"Deselect all items"

	self selection reverseDo: [ :aMonotoneSelection | self deselect: aMonotoneSelection from to: aMonotoneSelection to ]
]

{ #category : #'api - selection' }
BrSelectionModel >> deselectOne: anIndex [
	"Deselect items with a given index"

	self deselect: anIndex to: anIndex
]

{ #category : #'gt-inspector-extension' }
BrSelectionModel >> gtInspectorSelectionGraphIn: aComposite [
	<gtInspectorPresentationOrder: 1> 

	^ self selection gtInspectorSelectionGraphIn: aComposite
]

{ #category : #'gt-inspector-extension' }
BrSelectionModel >> gtInspectorSelectionListIn: aComposite [
	<gtInspectorPresentationOrder: 0> 

	^ self selection gtInspectorSelectionListIn: aComposite
]

{ #category : #'api - testing' }
BrSelectionModel >> hasSelection [
	<return: #Boolean>
	
	^ selection isNotEmpty
]

{ #category : #initialization }
BrSelectionModel >> initialize [
	super initialize.

	selection := BlCompositeSelection new
]

{ #category : #hooks }
BrSelectionModel >> initializeListeners [
	super initializeListeners.

	self when: BrSelectionRequest reply: [ BrSelectionChanged new selection: self selection ]
]

{ #category : #notifying }
BrSelectionModel >> notifyDeselected: anInterval [
	self dispatchEvent: (BrSelectionChanged new selection: self selection; deselectedInterval: anInterval)
]

{ #category : #notifying }
BrSelectionModel >> notifySelected: anInterval [
	self dispatchEvent: (BrSelectionChanged new selection: self selection; selectedInterval: anInterval)
]

{ #category : #notifying }
BrSelectionModel >> notifySelected: anInterval dueTo: aSourceEvent [
	self dispatchEvent: (BrSelectionChanged new selection: self selection; selectedInterval: anInterval; sourceEvent: aSourceEvent)
]

{ #category : #'api - selection' }
BrSelectionModel >> select: aFromIndex to: aToIndex [
	"Select items within a given interval"

	selection select: aFromIndex to: aToIndex.
	self notifySelected: (aFromIndex to: aToIndex)
]

{ #category : #'api - selection' }
BrSelectionModel >> select: aFromIndex to: aToIndex dueTo: aSourceEvent [
	"Select items within a given interval"

	selection select: aFromIndex to: aToIndex.
	self notifySelected: (aFromIndex to: aToIndex) dueTo: aSourceEvent
]

{ #category : #'api - selection' }
BrSelectionModel >> selectOne: anIndex [
	"Select an item at a given index deselecting all previously selected items"
	| thePreviouslySelected |

	thePreviouslySelected := Array streamContents: [ :aStream |
		selection do: [ :aMonotoneSelection | aStream nextPut: aMonotoneSelection interval ] ].
	
	selection removeAll.
	"we must notify after actually removing all selections"
	thePreviouslySelected do: [ :anInterval | self notifyDeselected: anInterval ].

	selection select: anIndex to: anIndex.
	self notifySelected: (anIndex to: anIndex)
]

{ #category : #'api - selection' }
BrSelectionModel >> selectOne: anIndex dueTo: aSourceEvent [
	"Select an item at a given index deselecting all previously selected items"
	| thePreviouslySelected |

	thePreviouslySelected := Array streamContents: [ :aStream |
		selection do: [ :aMonotoneSelection | aStream nextPut: aMonotoneSelection interval ] ].
	
	selection removeAll.
	"we must notify after actually removing all selections"
	thePreviouslySelected do: [ :anInterval | self notifyDeselected: anInterval ].

	selection select: anIndex to: anIndex.
	self notifySelected: (anIndex to: anIndex) dueTo: aSourceEvent
]

{ #category : #accessing }
BrSelectionModel >> selection [
	<return: #BlSelection>
	
	^ selection
]
