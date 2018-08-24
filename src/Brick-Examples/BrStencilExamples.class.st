Class {
	#name : #BrStencilExamples,
	#superclass : #Object,
	#category : 'Brick-Examples-Stencils'
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
	aList display: (1 to: 100).

	^ aList
]

{ #category : #'examples - list' }
BrStencilExamples >> createMaterialSimpleListUsingStencil [
	<gtExample>
	| aStencil aList |

	aStencil := self materialSimpleListStencil.

	aList := aStencil create.
	aList display: (1 to: 100).

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

{ #category : #'examples - instance creation' }
BrStencilExamples >> materialSimpleListStencil [
	<gtExample>
	
	^ BrMaterialSimpleListStencil new
]
