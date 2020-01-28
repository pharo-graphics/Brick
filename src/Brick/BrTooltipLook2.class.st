Class {
	#name : #BrTooltipLook2,
	#superclass : #BrAnchoredWithHandleAndContentLook,
	#category : #'Brick-Tooltip - Look'
}

{ #category : #'as yet unclassified' }
BrTooltipLook2 >> contentChangedClass [
	^ BrTooltipContentChanged
]

{ #category : #'as yet unclassified' }
BrTooltipLook2 >> contentRequest [
	^ BrTooltipContentRequest new
]

{ #category : #'as yet unclassified' }
BrTooltipLook2 >> handleChangedClass [
	^ BrTooltipHandleChanged
]

{ #category : #'as yet unclassified' }
BrTooltipLook2 >> handleRequest [
	^ BrTooltipHandleRequest new
]
