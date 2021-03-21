Class {
	#name : #BrResizerFitContentLength,
	#superclass : #BrResizerElementLength,
	#category : #'Brick-Resizer - Support'
}

{ #category : #'api - size' }
BrResizerFitContentLength >> adjustHeightFor: anElement [
	"Set element height"
	anElement constraintsDo: [ :c | c vertical fitContent ].
	anElement states addState: BrLayoutVerticalResizerState fitContent
]

{ #category : #'api - size' }
BrResizerFitContentLength >> adjustWidthFor: anElement [
	"Set element width"
	anElement constraintsDo: [ :c | c horizontal fitContent ].
	anElement states addState: BrLayoutHorizontalResizerState fitContent
]
