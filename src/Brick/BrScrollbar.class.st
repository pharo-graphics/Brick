Class {
	#name : #BrScrollbar,
	#superclass : #BlElement,
	#category : #'Brick-Scrollbar - UI'
}

{ #category : #'api - scrollbar' }
BrScrollbar >> beHorizontal [
	self dispatchEvent: (BrScrollbarOrientationWish horizontal)
]

{ #category : #'api - scrollbar' }
BrScrollbar >> beVertical [
	self dispatchEvent: (BrScrollbarOrientationWish vertical)
]

{ #category : #initialization }
BrScrollbar >> initialize [
	super initialize.
	
	self viewModel: (BrScrollbarModel new add: (BrInteractiveModel withAll: {
		BrScrollbarOrientationModel new beVertical
	}))
]

{ #category : #'api - scrollbar' }
BrScrollbar >> scrollable: aTBlScrollable [
	self viewModel scrollableElement: aTBlScrollable
]

{ #category : #'api - scrollbar' }
BrScrollbar >> thumb: aStencil [
	self viewModel thumbStencil: aStencil
]

{ #category : #'api - scrollbar' }
BrScrollbar >> track: aStencil [
	self viewModel trackStencil: aStencil
]
