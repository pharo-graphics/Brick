Class {
	#name : #BrStencilExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Stencils'
}

{ #category : #'examples - instance creation' }
BrStencilExamples >> coloredElementStencil [
	<gtExample>
	
	^ BrExampleColoredElementStencil new
]

{ #category : #'examples - colored element stencil' }
BrStencilExamples >> coloredElementUsingBlock [
	<gtExample>
	| aStencil anElement |
	
	aStencil := [ :aColor :aCornerRadius |
		BlElement new
			size: 200@200;
			background: aColor;
			geometry: (BlRectangle cornerRadius: aCornerRadius) ] asStencil.
	aStencil arguments: { (Color blue alpha: 0.5) . 50 }.

	anElement := aStencil create.

	self assert: anElement background equals: ((Color blue alpha: 0.5) asBlBackground).
	self assert: anElement geometry cornerRadii equals: (BlCornerRadii radius: 50).
	
	^ anElement
]

{ #category : #'examples - list' }
BrStencilExamples >> createMaterialSimpleListUsingBlock [
	<gtExample>
	| aStencil aList |
	aStencil := [ BrSimpleList new ] asStencil.
	aList := aStencil create.
	aList items: (1 to: 100).
	^ aList
]

{ #category : #'examples - list' }
BrStencilExamples >> createMaterialSimpleListUsingStencil [
	<gtExample>
	| aStencil aList |
	aStencil := self materialSimpleListStencil.
	aList := aStencil create.
	aList items: (1 to: 100).
	^ aList
]

{ #category : #'examples - colored element stencil' }
BrStencilExamples >> customizedColoredElementUsingStencil [
	<gtExample>
	| aStencil anElement |
	
	aStencil := self coloredElementStencil.
	aStencil color: (Color blue alpha: 0.5).
	aStencil cornerRadius: 50.
	
	anElement := aStencil create.

	self assert: anElement background equals: ((Color blue alpha: 0.5) asBlBackground).
	self assert: anElement geometry cornerRadii equals: (BlCornerRadii radius: 50).
	
	^ anElement
]

{ #category : #'examples - colored element stencil' }
BrStencilExamples >> defaultColoredElementUsingStencil [
	<gtExample>
	| aStencil anElement |
	
	aStencil := self coloredElementStencil.
	anElement := aStencil create.

	self assert: anElement background equals: (Color gray asBlBackground).
	self assert: anElement geometry cornerRadii equals: (BlCornerRadii radius: 20).
	
	^ anElement
]

{ #category : #'examples - colored element stencil' }
BrStencilExamples >> defaultElementUsingBlock [
	<gtExample>
	| aStencil anElement |
	
	aStencil := [
		BlElement new
			size: 200@200;
			background: Color gray;
			geometry: (BlRectangle cornerRadius: 20) ] asStencil.

	anElement := aStencil create.

	self assert: anElement background equals: (Color gray asBlBackground).
	self assert: anElement geometry cornerRadii equals: (BlCornerRadii radius: 20).
	
	^ anElement
]

{ #category : #converting }
BrStencilExamples >> elementToStencil [
	<gtExample>
	| anElement aStencil aSecondElement |
	anElement := BlElement new.
	aStencil := anElement asStencil.
	aSecondElement := aStencil asElement.
	self assert: anElement == aStencil.
	self assert: aSecondElement == anElement.
	^ anElement
]

{ #category : #converting }
BrStencilExamples >> elementToStencilBuilder [
	<gtExample>
	| anElement aStencilBuilder aSecondElement |
	anElement := BlElement new.
	aStencilBuilder := anElement asStencilBuilder.
	aSecondElement := aStencilBuilder asElement.
	self assert: (anElement == aStencilBuilder) not.
	self assert: (aStencilBuilder isKindOf: BrStencilBuilder).
	self assert: aSecondElement == anElement.
	^ aStencilBuilder
]

{ #category : #'examples - instance creation' }
BrStencilExamples >> materialSimpleListStencil [
	<gtExample>
	
	^ BrMaterialSimpleListStencil new
]
