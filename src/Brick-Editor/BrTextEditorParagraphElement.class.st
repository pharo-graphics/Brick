Class {
	#name : #BrTextEditorParagraphElement,
	#superclass : #BlElement,
	#instVars : [
		'paragraph',
		'text',
		'cursorElements',
		'cursorStencil',
		'selection',
		'segment'
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
					
				aStyleBuilder hasCustomDecoration
					ifTrue: [
						SkiaTextDecoration newDuring: [ :aSkiaDecoration |
							aStyleBuilder decoration applyOnSkiaDecoration: aSkiaDecoration.
							aTextStyle decoration: aSkiaDecoration ] ].

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
		fontCollection: (SkiaFontCollection new defaultFontManager: SkiaFontManager default)
		tabSize: 4.

	self childrenDo: [ :eachElement |
		(eachElement isKindOf: BlTextElement)
			ifTrue: [ self addText: eachElement text toBuilder: aBuilder ]
			ifFalse: [
				(eachElement isKindOf: BrCursorElement)
					ifFalse: [
						aBuilder
							addPlaceholder: (SkiaParagraphPlaceholderStyle new alignMiddle extent: eachElement measuredExtent)
							charLength: (eachElement userData at: #brickEditorCharLength ifAbsent: [ 0 ]) ] ] ].
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
			paragraph
				ifNotNil: [ :aParagraph | aParagraph paintOn: aCanvas at: self padding topLeft ].
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
		| aTextPosition eachCursorRectangle |
		
		aTextPosition := eachCursor textPosition.
		
		eachCursorRectangle := paragraph cursorRectangleForCharacter: aTextPosition.
		eachCursorRectangle := eachCursorRectangle expandBy: 0.5@0.
		eachCursorRectangle := eachCursorRectangle translateBy: ((eachCursorRectangle left min: 0) abs @ 0).
		eachCursorRectangle := eachCursorRectangle translateBy: ((self measuredWidth - eachCursorRectangle right) min: 0) @ 0.

		eachCursor measuredBounds
			extent: eachCursorRectangle extent;
			position: eachCursorRectangle origin + self padding topLeft ]
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
	| aParagraphLayoutWidth |
	self placeholderElements do:  [ :eachElement |
		self layout measureChildWithMargins: eachElement parentSpec: anExtentMeasurementSpec ].

	(paragraph isNil or: [ paragraph isNull ])
		ifTrue: [ self telemetry
				timeSync: 'Build paragraph'
				during: [ paragraph := self buildParagraph ] ].

	aParagraphLayoutWidth := anExtentMeasurementSpec widthSpec isUnspecified
		ifTrue: [ SmallInteger maxVal ]
		ifFalse: [ ((anExtentMeasurementSpec widthSpec size - self padding width) max: 0) ].

	self telemetry
		timeSync: 'Layout paragraph'
		during: [ paragraph layoutWithWidth: aParagraphLayoutWidth ].

	self measuredExtent: (anExtentMeasurementSpec sizeFor: (paragraph longestLine @ paragraph height) + self padding extent).
	
	self telemetry
		timeSync: 'Measure cursors'
		during: [ self cursorElements ifNotEmpty: [ :theCursors | self measureCursors: theCursors ] ]
]

{ #category : #drawing }
BrTextEditorParagraphElement >> paintChildrenOn: aCompositorPainter offset: anOffset [

	paragraph
		ifNotNil: [ :aParagraph |
			aParagraph paintOn: aCompositorPainter canvas at: anOffset + self padding topLeft.
			self paintSelectionOn: aCompositorPainter offset: anOffset + self padding topLeft ].

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
BrTextEditorParagraphElement >> relativeScreenToCursor: aTransformation of: anEditorElement [
	"trying to find a segment that actually contains a given position"
	| aCursor aFocusFinder aDirection aLocalTextPositionOfThisCursor aLocalPositionOfThisCursor aDesiredBounds aScreenPositionOfThisCursor |

	paragraph
		ifNil: [ ^ self ].

	aCursor := aTransformation cursor.
	aLocalTextPositionOfThisCursor := aCursor position - self segment textStart.

	aTransformation isUp
		ifTrue: [
			paragraph
				charOffsetAbove: aLocalTextPositionOfThisCursor
				ifFound: [ :aNewCursorPosition | ^ aTransformation transformed: self segment textStart + aNewCursorPosition ]
				ifNone: [  ] ]
		ifFalse: [ 
			paragraph
				charOffsetBelow: aLocalTextPositionOfThisCursor
				ifFound: [ :aNewCursorPosition | ^ aTransformation transformed: self segment textStart + aNewCursorPosition ]
				ifNone: [  ]	 ].
	
	aDirection := aTransformation isUp
		ifTrue: [ BlFocusSearchDirectionUp new ]
		ifFalse: [ BlFocusSearchDirectionDown new ].

	aLocalPositionOfThisCursor := (paragraph cursorRectangleForCharacter: aLocalTextPositionOfThisCursor) center + self padding topLeft.

	aDesiredBounds := anEditorElement localBoundsToMine: (BlBounds origin: aLocalPositionOfThisCursor extent: 0.0@0.0) fromChild: self.
	aScreenPositionOfThisCursor := aDesiredBounds center.

	aCursor hasDesiredCoordinate
		ifTrue: [ aDesiredBounds translateX: (aCursor desiredCoordinate - aScreenPositionOfThisCursor x) Y: 0 ]
		ifFalse: [ aCursor desiredCoordinate: aScreenPositionOfThisCursor x ].

	aFocusFinder := BlFocusFinder new.
	(aFocusFinder
		root: anEditorElement;
		referenceArea: aDesiredBounds;
		direction: aDirection)
			nextFocusDo: [ :aReceiverElement |
				(aReceiverElement isKindOf: self class)
					ifTrue: [ aReceiverElement screenToCursor: aTransformation of: anEditorElement at: aDesiredBounds center ] ]
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
BrTextEditorParagraphElement >> screenToCursor: aTransformation of: anEditorElement at: aCursorInEditorPosition [
	"trying to find a segment that actually contains a given position"
	| theBoundsInLocal aCharOffsetInParagraph |

	paragraph
		ifNil: [ ^ self ].

	theBoundsInLocal := self
		globalBoundsToMine: (BlBounds origin: aCursorInEditorPosition extent: 0@0)
		fromParent: anEditorElement.
		
	aCharOffsetInParagraph := paragraph
		charOffsetAt: theBoundsInLocal center - self padding topLeft.

	aTransformation transformed: aCharOffsetInParagraph + self segment textStart
]

{ #category : #accessing }
BrTextEditorParagraphElement >> segment [
	^ segment
]

{ #category : #accessing }
BrTextEditorParagraphElement >> segment: anObject [
	segment := anObject
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
