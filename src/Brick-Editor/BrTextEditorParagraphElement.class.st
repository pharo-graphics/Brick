Class {
	#name : #BrTextEditorParagraphElement,
	#superclass : #BlElement,
	#instVars : [
		'paragraph'
	],
	#category : #'Brick-Editor-UI'
}

{ #category : #'hooks - children' }
BrTextEditorParagraphElement >> buildParagraph [
	| aBuilder |
	aBuilder := SkiaParagraphBuilder
		style: (SkiaParagraphStyle new textStyle: (SkiaParagraphTextStyle new color: Color black))
		fontCollection: (SkiaFontCollection new defaultFontManager: SkiaFontManager default).
	
	self childrenDo: [ :eachElement |
		(eachElement isKindOf: BlTextElement)
			ifTrue: [ aBuilder addString: eachElement text asString ]
			ifFalse: [ aBuilder addPlaceholder: (SkiaParagraphPlaceholderStyle new alignTop extent: eachElement measuredExtent) ] ].
	
	^ aBuilder build
]

{ #category : #drawing }
BrTextEditorParagraphElement >> drawChildrenOnSpartaCanvas: aCanvas [
	aCanvas clip
		when: [ self clipChildren ]
		by: [ self geometry pathOnSpartaCanvas: aCanvas of: self ]
		during: [
			paragraph paintOn: aCanvas at: 0@0.
			self children sortedByElevation
				do: [ :anElement | 
					(anElement isKindOf: BlTextElement)
						ifFalse: [ anElement fullDrawOnSpartaCanvas: aCanvas ] ] ]
]

{ #category : #'hooks - children' }
BrTextEditorParagraphElement >> onChildAdded: anElement [
	super onChildAdded: anElement.
	
	paragraph := nil
]

{ #category : #'hooks - children' }
BrTextEditorParagraphElement >> onLayout: aBounds [
	| placeholders |
	
	placeholders := self children reject: [ :each | each isKindOf: BlTextElement ].
	placeholders with: paragraph placeholderRectangles do: [ :eachElement :eachBounds |
		eachElement applyLayoutIn: eachBounds ].
]

{ #category : #'hooks - children' }
BrTextEditorParagraphElement >> onMeasure: anExtentMeasurementSpec [
	self childrenDo: [ :eachElement |
		(eachElement isKindOf: BlTextElement)
			ifFalse: [ self layout measureChildWithMargins: eachElement parentSpec: anExtentMeasurementSpec ] ].

	paragraph := self buildParagraph.
	paragraph layoutWithWidth: anExtentMeasurementSpec widthSpec size.
	
	self measuredExtent: (anExtentMeasurementSpec sizeFor: paragraph longestLine @ paragraph height)
]

{ #category : #drawing }
BrTextEditorParagraphElement >> paintChildrenOn: aCompositorPainter offset: anOffset [
	paragraph paintOn: aCompositorPainter canvas at: anOffset.

	aCompositorPainter
		pushChildren: self children sortedByElevation
		offset: anOffset
		compositing: self compositingMode
		thenPaint: [ :aChildElement :aChildPainter :aChildOffset |
			(aChildElement isKindOf: BlTextElement)
				ifFalse: [ aChildElement fullPaintOn: aChildPainter offset: aChildOffset ] ]
]
