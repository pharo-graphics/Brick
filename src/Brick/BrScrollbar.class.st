Class {
	#name : #BrScrollbar,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#category : #'Brick-Scrollbar - UI'
}

{ #category : #'api - scrollbar' }
BrScrollbar >> beHorizontal [
	self states addState: BrScrollbarOrientationState horizontal
]

{ #category : #'api - scrollbar' }
BrScrollbar >> beVertical [
	self states addState: BrScrollbarOrientationState vertical
]

{ #category : #initialization }
BrScrollbar >> initialize [
	super initialize.
	
	self viewModel: (BrScrollbarModel new).
	
	self vLocal; hLocal.
	
	self beVertical.
	self beInSeparateCompositionLayer
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
