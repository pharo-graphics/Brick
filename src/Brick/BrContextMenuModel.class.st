Class {
	#name : #BrContextMenuModel,
	#superclass : #BrAnchoredModel,
	#category : #'Brick-Context Menu - Model'
}

{ #category : #notifying }
BrContextMenuModel >> contentChangedEvent [
	^ BrContextMenuContentChanged new
]

{ #category : #'as yet unclassified' }
BrContextMenuModel >> contentRequestClass [
	^ BrContextMenuContentRequest
]

{ #category : #notifying }
BrContextMenuModel >> handleChangedEvent [
	^ BrContextMenuHandleChanged new
]

{ #category : #'as yet unclassified' }
BrContextMenuModel >> handleRequestClass [
	^ BrContextMenuHandleRequest
]
