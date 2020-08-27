Class {
	#name : #BrTextEditorParagraphElement,
	#superclass : #BlElement,
	#instVars : [
		'paragraph',
		'text',
		'cursorElements',
		'cursorStencil',
		'selection'
	],
	#classInstVars : [
		'aCompositorPainter'
	],
	#category : #'Brick-Editor-UI'
}

{ #category : #'api - cursor' }
BrTextEditorParagraphElement >> addCursorAt: aTextPosition [
	<return: #BrCursorElement>

	^ self
		cursorAt: aTextPosition
		ifFound: #yourself
		ifNone: [
			| aCursorElement |
			aCursorElement := self newCursor.
			aCursorElement textPosition: aTextPosition.
			cursorElements add: aCursorElement.
			self addChild: aCursorElement.
			aCursorElement ]
]

{ #category : #'private - paragraph' }
BrTextEditorParagraphElement >> addText: aBlText toBuilder: aParagraphBuilder [
	| anIterator |
	
	anIterator := aBlText iterator.
	[ anIterator hasNext ] whileTrue: [
		| eachSpan |
		
		eachSpan := anIterator nextSpan.
		
		eachSpan attributes ifNotEmpty: [ :theAttributes |
			| aStyleBuilder |

			aStyleBuilder := BrTextEditorParagraphTextStyleBuilder new.
			theAttributes do: [ :eachAttribute | eachAttribute applyOnSpartaFontBuilder: aStyleBuilder ].
			theAttributes do: [ :eachAttribute | eachAttribute applyOnSpartaTextPainter: aStyleBuilder ].
		
			SkiaParagraphTextStyle newDuring: [ :aTextStyle |				
				aStyleBuilder hasCustomFontStyle
					ifTrue: [ aStyleBuilder asFontStyleDuring: [ :aSkiaFontStyle | aTextStyle fontStyle: aSkiaFontStyle ] ].
					
				aStyleBuilder hasCustomFontSize
					ifTrue: [ aTextStyle fontSize: aStyleBuilder fontSize ]
					ifFalse: [ aTextStyle fontSize: self defaultFontSize ].
					
				aStyleBuilder hasCustomFamilyName
					ifTrue: [ aTextStyle fontFamily: aStyleBuilder familyName ].
					
				aStyleBuilder hasCustomColor
					ifTrue: [ aTextStyle color: aStyleBuilder color ]
					ifFalse: [ aTextStyle color: self defaultTextColor ].
			
				aParagraphBuilder
					pushStyle: aTextStyle;
					addString: eachSpan asString;
					popStyle
				
			].
		]
		ifEmpty: [ aParagraphBuilder addString: eachSpan asString ].
		
	]
]

{ #category : #'private - paragraph' }
BrTextEditorParagraphElement >> buildParagraph [
	| aBuilder |

	aBuilder := SkiaParagraphBuilder
		style: (SkiaParagraphStyle new textStyle: (SkiaParagraphTextStyle new color: Color black; fontSize: self defaultFontSize))
		fontCollection: (SkiaFontCollection new defaultFontManager: SkiaFontManager default).
	
	self childrenDo: [ :eachElement |
		(eachElement isKindOf: BlTextElement)
			ifTrue: [ self addText: eachElement text toBuilder: aBuilder ]
			ifFalse: [
				(eachElement isKindOf: BrCursorElement)
					ifFalse: [ aBuilder addPlaceholder: (SkiaParagraphPlaceholderStyle new alignTop extent: eachElement measuredExtent) ] ] ].

	^ aBuilder build
]

{ #category : #private }
BrTextEditorParagraphElement >> cursorAt: aTextPosition ifFound: aFoundBlock ifNone: aNoneBlock [

	^ cursorElements
		detect: [ :aCursor | aCursor textPosition = aTextPosition ]
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #accessing }
BrTextEditorParagraphElement >> cursorElements [
	<return: #Collection of: #BrCursorElement>

	^ cursorElements
]

{ #category : #accessing }
BrTextEditorParagraphElement >> cursorStencil [
	^ cursorStencil
]

{ #category : #accessing }
BrTextEditorParagraphElement >> cursorStencil: aStencil [
	cursorStencil := aStencil
]

{ #category : #initialization }
BrTextEditorParagraphElement >> defaultFontSize [
	^ 12
]

{ #category : #initialization }
BrTextEditorParagraphElement >> defaultSelectionColor [
	^ (Color r: 0 g: 112 b: 252 range: 255) alpha: 0.3
]

{ #category : #initialization }
BrTextEditorParagraphElement >> defaultTextColor [
	^ Color black
]

{ #category : #drawing }
BrTextEditorParagraphElement >> drawChildrenOnSpartaCanvas: aCanvas [
	aCanvas clip
		when: [ self clipChildren ]
		by: [ self geometry pathOnSpartaCanvas: aCanvas of: self ]
		during: [
			paragraph paintOn: aCanvas at: self padding topLeft.
			self children sortedByElevation
				do: [ :anElement |
					(anElement isKindOf: BlTextElement)
						ifFalse: [ anElement fullDrawOnSpartaCanvas: aCanvas ] ] ]
]

{ #category : #drawing }
BrTextEditorParagraphElement >> drawSelectionOnSpartaCanvas: aCanvas [
	| aPathBuilder |
	
	selection isEmpty
		ifTrue: [ ^ self ].

	aPathBuilder := aCanvas path.

	selection do: [ :eachMonotoneSelection |		
		(paragraph rectanglesForChars: (eachMonotoneSelection from to: eachMonotoneSelection to)
			width: SkiaParagraphRectWidthStyle Max
			height: SkiaParagraphRectHeightStyle Max) do: [ :eachRectangle |
				aPathBuilder
					moveTo: eachRectangle topLeft;
					lineTo: eachRectangle topRight;
					lineTo: eachRectangle bottomRight;
					lineTo: eachRectangle bottomLeft;
					lineTo: eachRectangle topLeft;
					close ] ].

	aCanvas fill
		path: aPathBuilder build;
		paint: self defaultSelectionColor;
		draw
]

{ #category : #'api - cursor' }
BrTextEditorParagraphElement >> hideCursors [
	self cursorElements do: [ :aCursorElement | aCursorElement visibility: BlVisibility gone ]
]

{ #category : #initialization }
BrTextEditorParagraphElement >> initialize [
	super initialize.

	cursorElements := OrderedCollection new.
	cursorStencil := BrCursorStencil uniqueInstance.
	text := BlText empty.
	selection := BlSelection empty
]

{ #category : #layout }
BrTextEditorParagraphElement >> measureCursors: aCollectionOfCursorElements [
	aCollectionOfCursorElements do: [ :eachCursor |
		| aTextPosition theRectangles aCharInterval |
		
		aTextPosition := eachCursor textPosition.
		
		aCharInterval := (aTextPosition - 1 max: 0)
			to: ((aTextPosition max: 1) min: self text size).

		theRectangles := paragraph
			rectanglesForChars: aCharInterval
			width: SkiaParagraphRectWidthStyle Tight
			height: SkiaParagraphRectHeightStyle Max.

		theRectangles ifNotEmpty: [
			| thePosition |
			
			thePosition := aTextPosition isZero
				ifTrue: [ theRectangles first topLeft ]
				ifFalse: [ theRectangles first topRight ].
			
			eachCursor measuredBounds
				extent: (eachCursor measuredWidth max: 1) @ (theRectangles first height max: 10);
				position: thePosition + self padding topLeft ] ]
]

{ #category : #private }
BrTextEditorParagraphElement >> newCursor [
	"Create and return a new instance of a cursor element"
	<return: #BlElement>

	^ self cursorStencil asElement
]

{ #category : #'hooks - children' }
BrTextEditorParagraphElement >> onChildAdded: anElement [
	super onChildAdded: anElement.
	
	(anElement isKindOf: BrCursorElement)
		ifFalse: [ paragraph := nil ]
	
	
]

{ #category : #layout }
BrTextEditorParagraphElement >> onLayout: aBounds [
	| placeholders |
	
	placeholders := self placeholderElements.
	placeholders with: paragraph placeholderRectangles do: [ :eachElement :eachBounds |
		eachElement applyLayoutIn: (eachBounds translateBy: self padding topLeft) ].
	
	self cursorElements do: [ :eachCursor | eachCursor applyLayoutIn: eachCursor measuredBounds asRectangle ].
]

{ #category : #layout }
BrTextEditorParagraphElement >> onMeasure: anExtentMeasurementSpec [
	self placeholderAndCursorElements do:  [ :eachElement |
		self layout measureChildWithMargins: eachElement parentSpec: anExtentMeasurementSpec ].

	paragraph := self buildParagraph.
	paragraph layoutWithWidth: anExtentMeasurementSpec widthSpec size.

	self measuredExtent: (anExtentMeasurementSpec sizeFor: paragraph longestLine @ paragraph height) + self padding extent.
	self cursorElements ifNotEmpty: [ :theCursors | self measureCursors: theCursors ]
]

{ #category : #drawing }
BrTextEditorParagraphElement >> paintChildrenOn: aCompositorPainter offset: anOffset [
	paragraph paintOn: aCompositorPainter canvas at: anOffset + self padding topLeft.
	self paintSelectionOn: aCompositorPainter offset: anOffset + self padding topLeft.
	
	aCompositorPainter
		pushChildren: self children sortedByElevation
		offset: anOffset
		compositing: self compositingMode
		thenPaint: [ :aChildElement :aChildPainter :aChildOffset |
			(aChildElement isKindOf: BlTextElement)
				ifFalse: [ aChildElement fullPaintOn: aChildPainter offset: aChildOffset ] ]
]

{ #category : #drawing }
BrTextEditorParagraphElement >> paintSelectionOn: aCompositorPainter offset: anOffset [
	selection isEmpty
		ifTrue: [ ^ self ].

	aCompositorPainter canvas transform
		by: [ :t | t translateBy: anOffset ]
		during: [ self drawSelectionOnSpartaCanvas: aCompositorPainter canvas ]
]

{ #category : #private }
BrTextEditorParagraphElement >> placeholderAndCursorElements [
	^ self children reject: [ :each | (each isKindOf: BlTextElement) ]
]

{ #category : #private }
BrTextEditorParagraphElement >> placeholderElements [
	^ self children reject: [ :each | (each isKindOf: BlTextElement) or: [ each isKindOf: BrCursorElement ] ]
]

{ #category : #'api - cursor' }
BrTextEditorParagraphElement >> removeCursorAt: aTextIndex [
	"Remove cursor at a goven position"

	^ self
		cursorAt: aTextIndex
		ifFound: [ :aCursorElement |
			cursorElements remove: aCursorElement.
			aCursorElement removeFromParent.
			aCursorElement ]
		ifNone: [ self error: 'Cursor at ', aTextIndex asString, ' does not exist' ]
]

{ #category : #'api - cursor' }
BrTextEditorParagraphElement >> removeCursors [
	"Remove all cursors"

	self cursorElements reverseDo: [ :eachCursorElement | eachCursorElement removeFromParent ].
	self cursorElements removeAll
]

{ #category : #'api - cursor' }
BrTextEditorParagraphElement >> screenToCursor: aTransformation at: aPositionInSegment in: aSegment [
	paragraph
		ifNil: [ ^ self ].

	aTransformation transformed: (aSegment textStart + (paragraph charPositionAt: aPositionInSegment - self padding topLeft))
]

{ #category : #accessing }
BrTextEditorParagraphElement >> selection [
	^ selection
]

{ #category : #accessing }
BrTextEditorParagraphElement >> selection: anObject [
	selection := anObject.
	self invalidate
]

{ #category : #'api - cursor' }
BrTextEditorParagraphElement >> setCursors: aCollectionOfCursorPositions [
	<return: #BrCursorElement>
	| theExistingCursors theAddedCursors theRemovedCursors |
	
	theExistingCursors := self cursorElements collect: [ :eachElement | eachElement textPosition ].
	theAddedCursors := aCollectionOfCursorPositions difference: theExistingCursors.
	theRemovedCursors := theExistingCursors difference: aCollectionOfCursorPositions.
	
	theRemovedCursors do: [ :eachToRemove | self removeCursorAt: eachToRemove ].
	theAddedCursors do: [ :eachToAdd | self addCursorAt: eachToAdd ]
]

{ #category : #'api - cursor' }
BrTextEditorParagraphElement >> showCursors [
	self cursorElements do: [ :aCursorElement |
		aCursorElement visibility: BlVisibility visible.
		aCursorElement hasParent
			ifFalse: [ self addChild: aCursorElement ] ]
]

{ #category : #accessing }
BrTextEditorParagraphElement >> text [
	^ text
]

{ #category : #accessing }
BrTextEditorParagraphElement >> text: aBlText [
	text := aBlText
]

{ #category : #private }
BrTextEditorParagraphElement >> textElements [
	^ self children select: [ :each | each isKindOf: BlTextElement ]
]
