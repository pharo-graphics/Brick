Class {
	#name : #BrEditor,
	#superclass : #BrEditorElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#category : #'Brick-Editor-UI'
}

{ #category : #initialization }
BrEditor >> initialize [
	super initialize.
	
	self editor: BrTextEditor new.
	
	self viewModel: (BrInteractiveModel withAll: {
		BrLayoutHorizontalResizerModel matchParent.
		BrLayoutVerticalResizerModel fitContent }).

	self look: (BrLayoutResizerLook inherit)
]

{ #category : #'editor - accessing' }
BrEditor >> styler [
	^ self editor styler
]

{ #category : #'editor - accessing' }
BrEditor >> styler: aStyler [
	self editor styler: aStyler
]

{ #category : #'editor - accessing' }
BrEditor >> text [
	^ self editor text
]

{ #category : #'editor - accessing' }
BrEditor >> text: aBlText [
	self editor text: aBlText asRopedText
]
