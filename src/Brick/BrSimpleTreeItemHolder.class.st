Class {
	#name : #BrSimpleTreeItemHolder,
	#superclass : #BrTreeItemHolder,
	#instVars : [
		'nodeElement'
	],
	#category : #'Brick-Tree - Support'
}

{ #category : #accessing }
BrSimpleTreeItemHolder >> nodeElement [
	<return: #BlElement>

	^ nodeElement
]

{ #category : #accessing }
BrSimpleTreeItemHolder >> nodeElement: anElement [
	nodeElement := anElement
]
