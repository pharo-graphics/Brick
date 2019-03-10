Class {
	#name : #BrListStencilExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-List'
}

{ #category : #'examples - list label' }
BrListStencilExamples >> createCustomTextListLabel [
	<gtExample>	
	| aStencil anElement |
	
	aStencil := self listLabelStencil.
	aStencil text: 'Custom label'.
	anElement := aStencil create.
	
	self assert: anElement text asString equals: 'Custom label'.
	self assert: anElement margin equals: (BlInsets all: 3).
	self assert: anElement constraints horizontal resizer isMatchParent.
	self assert: anElement constraints vertical resizer isFitContent.
	
	^ anElement
]

{ #category : #'examples - list label' }
BrListStencilExamples >> createDefaultListLabel [
	<gtExample>	
	| aStencil anElement |
	
	aStencil := self listLabelStencil.
	anElement := aStencil create.
	
	self assert: anElement text asString equals: 'Label'.
	self assert: anElement margin equals: (BlInsets all: 3).
	self assert: anElement constraints horizontal resizer isMatchParent.
	self assert: anElement constraints vertical resizer isFitContent.
	
	^ anElement
]

{ #category : #'examples - instance creation' }
BrListStencilExamples >> listLabelStencil [
	<gtExample>
	| aStencil |
	
	aStencil := BrColumnCellLabelStencil new.
	self assert: aStencil text asString equals: 'Label'.

	^ aStencil
]
