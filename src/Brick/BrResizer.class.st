Class {
	#name : #BrResizer,
	#superclass : #BlElement,
	#instVars : [
		'locationModel',
		'resizerModel'
	],
	#category : #'Brick-Resizer - UI'
}

{ #category : #location }
BrResizer >> beBottom [
	locationModel beBottom
]

{ #category : #location }
BrResizer >> beLeft [
	locationModel beLeft
]

{ #category : #location }
BrResizer >> beRight [
	locationModel beRight
]

{ #category : #location }
BrResizer >> beTop [
	locationModel beTop
]

{ #category : #initialization }
BrResizer >> initialize [
	super initialize.
	
	self viewModel: (resizerModel := BrResizerModel new
		add: (BrInteractiveModel withAll: {
			locationModel := BrResizerLocationModel new.
			BrHoverModel new. 
			BrPressModel new.
		}))
]

{ #category : #accessing }
BrResizer >> target: anElement [
	"Set which element should be resized with this resizer"
	
	resizerModel target: anElement
]
