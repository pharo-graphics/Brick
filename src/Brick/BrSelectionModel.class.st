Class {
	#name : #BrSelectionModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'selection'
	],
	#category : #'Brick-! Core'
}

{ #category : #printing }
BrSelectionModel class >> modelName [
	^ 'Selection'
]

{ #category : #'api - testing' }
BrSelectionModel >> contains: anIndex [
	"Return true if item at a given index is selected, false otherwise"
	<return: #Boolean>

	^ selection containsIndex: anIndex
]

{ #category : #'api - selection' }
BrSelectionModel >> deselect: aFromIndex to: aToIndex [
	"Deselect items within a given interval"

	selection deselect: aFromIndex - 1 to: aToIndex.
	self notifyDeselected: (aFromIndex to: aToIndex)
]

{ #category : #'api - selection' }
BrSelectionModel >> deselectAll [
	"Deselect all items"

	selection reverseDo: [ :aMonotoneSelection | self deselect: aMonotoneSelection from + 1 to: aMonotoneSelection to ]
]

{ #category : #'api - selection' }
BrSelectionModel >> deselectOne: anIndex [
	"Deselect items with a given index"

	self deselect: anIndex to: anIndex
]

{ #category : #'api - testing' }
BrSelectionModel >> hasSelection [
	<return: #Boolean>
	
	^ selection isNotEmpty
]

{ #category : #'api - accessing' }
BrSelectionModel >> indices [
	<return: #Collection of: #Number>
	
	^ selection indices
]

{ #category : #initialization }
BrSelectionModel >> initialize [
	super initialize.

	selection := BlCompositeSelection new
]

{ #category : #hooks }
BrSelectionModel >> initializeListeners [
	super initializeListeners.

	self when: BrSelectionRequest reply: [ :aResponse | aResponse selection: selection ]
]

{ #category : #notifying }
BrSelectionModel >> notifyDeselected: anInterval [
	self dispatchEvent: (BrSelectionChanged new selection: selection; deselectedInterval: anInterval)
]

{ #category : #notifying }
BrSelectionModel >> notifySelected: anInterval [
	self
		notifySelected: anInterval
		dueTo: nil
]

{ #category : #notifying }
BrSelectionModel >> notifySelected: anInterval dueTo: aSourceEvent [
	self dispatchEvent: (BrSelectionChanged new selection: selection; selectedInterval: anInterval; sourceEvent: aSourceEvent)
]

{ #category : #'api - selection' }
BrSelectionModel >> select: aFromIndex to: aToIndex [
	"Select items within a given interval"

	self
		select: aFromIndex
		to: aToIndex
		dueTo: nil
]

{ #category : #'api - selection' }
BrSelectionModel >> select: aFromIndex to: aToIndex dueTo: aSourceEvent [
	"Select items within a given interval"

	selection select: aFromIndex - 1 to: aToIndex.
	self notifySelected: (aFromIndex to: aToIndex) dueTo: aSourceEvent
]

{ #category : #'api - selection' }
BrSelectionModel >> selectOne: anIndex [
	"Select an item at a given index deselecting all previously selected items"
	
	self
		selectOne: anIndex
		dueTo: nil
]

{ #category : #'api - selection' }
BrSelectionModel >> selectOne: anIndex dueTo: aSourceEvent [
	"Select an item at a given index deselecting all previously selected items"
	| thePreviouslySelected |

	thePreviouslySelected := Array streamContents: [ :aStream |
		selection do: [ :aMonotoneSelection | aStream nextPut: aMonotoneSelection indices ] ].
	
	selection removeAll.
	"we must notify after actually removing all selections"
	thePreviouslySelected do: [ :anInterval | self notifyDeselected: anInterval ].

	selection select: anIndex - 1 to: anIndex.
	self notifySelected: (anIndex to: anIndex) dueTo: aSourceEvent
]
