Extension { #name : #TBlTextStyleable }

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> expanded: aBoolean adornment: aBrTextAdornmentStencilBuilder [
	"Append a visual element defined by a given stencil builder right after a text on which I am applied.
	A stencil builder can also be a block in the following form:
	[ :aTBrTextEditorTextualPiece :anEditorElement | ] - where aText represents a piece of text after which an element should be append"

	self attributesBuilder attribute: (
		BrGlamorousTrangleExpanderTextAttribute new 
			isExpanded: aBoolean;
			attributesCreatingBlock: [
				BrTextAdornmentDynamicAttribute new 	
					beAppend;
					stencil: aBrTextAdornmentStencilBuilder ])
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> expandingAdornment: aBrTextAdornmentStencilBuilder [
	"Append a visual element defined by a given stencil builder right after a text on which I am applied.
	A stencil builder can also be a block in the following form:
	[ :aTBrTextEditorTextualPiece :anEditorElement | ] - where aText represents a piece of text after which an element should be append"

	self expanded: false adornment: aBrTextAdornmentStencilBuilder
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeFont [
	self fontName: 'Source Code Pro'
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeFontAndSize [
	self 
		glamorousCodeFont;
		glamorousCodeSize 
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeFontAndSmallSize [
	self 
		glamorousCodeFont;
		glamorousCodeSmallSize
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeFontDo: aBlock [
	| attribute |
	attribute := BlFontFamilyAttribute named: 'Source Code Pro'.
	self attributesBuilder attribute: attribute.
	aBlock value: attribute.
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeMiniSize [
	self fontSize: 8
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeSize [
	self fontSize: 14
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeSizeDo: aBlock [
	| attribute |
	attribute := BlFontSizeAttribute size: 14.
	self attributesBuilder attribute: attribute.
	aBlock value: attribute.
	^ attribute
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeSmallSize [
	self fontSize: 12
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeTinySize [
	self fontSize: 10
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousMonospace [
	self glamorousCodeFont
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousRegularFont [
	self fontName: 'Source Sans Pro'
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousRegularFontAndSize [
	self 
		glamorousRegularFont;
		glamorousRegularSize 
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousRegularSize [
	self fontSize: 14
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousRegularSmallSize [
	self fontSize: 12
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousRoundedBackground [
	self attribute: (BrTextEmbellishmentAttribute new roundedBackground: BrGlamorousColors neutralBackgroundColor)
]
