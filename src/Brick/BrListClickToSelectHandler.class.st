Class {
	#name : #BrListClickToSelectHandler,
	#superclass : #BlCustomEventHandler,
	#instVars : [
		'listWidget'
	],
	#category : #'Brick-List - Support'
}

{ #category : #'api - accessing' }
BrListClickToSelectHandler >> clickEvent: aBlClickEvent [
	aBlClickEvent consumed: true.

	listWidget selectOne: (aBlClickEvent currentTarget constraints infinite holder dataSourcePosition) dueTo: aBlClickEvent.
	listWidget requestFocus
]

{ #category : #'api - accessing' }
BrListClickToSelectHandler >> doubleClickEvent: aBlDoubleClickEvent [
	aBlDoubleClickEvent consumed: true.

	listWidget dispatchEvent: (BrSelectionDoubleClicked new selection: listWidget selectedIndices; sourceEvent: aBlDoubleClickEvent)
]

{ #category : #'api - accessing' }
BrListClickToSelectHandler >> eventsToHandle [
	^ { BlClickEvent . BlDoubleClickEvent }
]

{ #category : #accessing }
BrListClickToSelectHandler >> listWidget [
	^ listWidget
]

{ #category : #accessing }
BrListClickToSelectHandler >> listWidget: anObject [
	listWidget := anObject
]
