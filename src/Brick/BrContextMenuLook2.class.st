Class {
	#name : #BrContextMenuLook2,
	#superclass : #BrAnchoredWithHandleAndContentLook,
	#category : #'Brick-Context Menu - Look'
}

{ #category : #'as yet unclassified' }
BrContextMenuLook2 >> contentChangedClass [
	^ BrContextMenuContentChanged
]

{ #category : #'as yet unclassified' }
BrContextMenuLook2 >> contentRequest [
	^ BrContextMenuContentRequest new
]

{ #category : #'as yet unclassified' }
BrContextMenuLook2 >> handleChangedClass [
	^ BrContextMenuHandleChanged
]

{ #category : #'as yet unclassified' }
BrContextMenuLook2 >> handleRequest [
	^ BrContextMenuHandleRequest new
]
