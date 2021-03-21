Class {
	#name : #BrTreeClickToSelectHandler,
	#superclass : #BlCustomEventHandler,
	#instVars : [
		'treeWidget'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #'api - accessing' }
BrTreeClickToSelectHandler >> clickEvent: aBlClickEvent [
	aBlClickEvent consumed: true.

	treeWidget selectOne: (aBlClickEvent currentTarget constraints infinite holder dataSourcePosition) dueTo: aBlClickEvent.
	treeWidget requestFocus
]

{ #category : #'api - accessing' }
BrTreeClickToSelectHandler >> doubleClickEvent: aBlDoubleClickEvent [
	aBlDoubleClickEvent consumed: true.

	treeWidget dispatchEvent: (BrSelectionDoubleClicked new selection: treeWidget selectedIndices; sourceEvent: aBlDoubleClickEvent)
]

{ #category : #'api - accessing' }
BrTreeClickToSelectHandler >> eventsToHandle [
	^ { BlClickEvent . BlDoubleClickEvent }
]

{ #category : #accessing }
BrTreeClickToSelectHandler >> treeWidget [
	^ treeWidget
]

{ #category : #accessing }
BrTreeClickToSelectHandler >> treeWidget: anObject [
	treeWidget := anObject
]
