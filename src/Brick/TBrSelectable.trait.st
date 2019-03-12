Trait {
	#name : #TBrSelectable,
	#instVars : [
		'selectionModel'
	],
	#category : #'Brick-! Core - Support'
}

{ #category : #'api - selection' }
TBrSelectable >> deselectAll [
	"Deselect all items"

	selectionModel deselectAll
]

{ #category : #'api - selection' }
TBrSelectable >> isSelectedAt: anIndex [
	<return: #Boolean>

	^ selectionModel contains: anIndex
]

{ #category : #'api - selection' }
TBrSelectable >> maxSelectionIndex [
	<return: #Number>
	
	^ self explicitRequirement
]

{ #category : #'api - selection' }
TBrSelectable >> selectNext [
	selectionModel selection isEmpty
		ifTrue: [ self selectOne: 1  ]
		ifFalse: [ self selectOne: ((selectionModel selection to + 1) min: self maxSelectionIndex) ]
]

{ #category : #'api - selection' }
TBrSelectable >> selectOne: anIndex [
	selectionModel selectOne: anIndex
]

{ #category : #'api - selection' }
TBrSelectable >> selectOne: anIndex dueTo: aSourceEvent [
	selectionModel selectOne: anIndex dueTo: aSourceEvent
]

{ #category : #'api - selection' }
TBrSelectable >> selectPrevious [
	selectionModel selection isEmpty
		ifTrue: [ self selectOne: 1  ]
		ifFalse: [ self selectOne: ((selectionModel selection to - 1) max: 1) ]
]

{ #category : #'api - selection' }
TBrSelectable >> selection [
	<return: #BlSelection>

	^ selectionModel selection
]
