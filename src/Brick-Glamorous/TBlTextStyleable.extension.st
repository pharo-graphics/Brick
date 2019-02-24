Extension { #name : #TBlTextStyleable }

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeFont [
	^ self fontName: 'Source Code Pro'
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousCodeFontAndSize [
	^ self 
		glamorousCodeFont;
		fontSize: 12
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousMonospace [
	^ self glamorousCodeFont
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousRegularFont [
	^ self fontFamily: 'Source Sans Pro'
]

{ #category : #'*Brick-Glamorous' }
TBlTextStyleable >> glamorousRegularFontAndSize [
	^ self 
		fontFamily: 'Source Sans Pro';
		fontSize: 14
]
