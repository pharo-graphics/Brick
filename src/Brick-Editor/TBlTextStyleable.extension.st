Extension { #name : #TBlTextStyleable }

{ #category : #'*Brick-Editor' }
TBlTextStyleable >> lineSpacing: aNumber [
	self attributesBuilder attribute: (BrTextParagraphLineSpacingAttribute lineSpacing: aNumber)
]

{ #category : #'*Brick-Editor' }
TBlTextStyleable >> paragraphMargin: anInsets [
	self attributesBuilder attribute: (BrTextParagraphMarginAttribute paragraphMargin: anInsets)
]

{ #category : #'*Brick-Editor' }
TBlTextStyleable >> wordPadding: anInsets [
	self attributesBuilder attribute: (BrTextParagraphWordPaddingAttribute wordPadding: anInsets)
]
