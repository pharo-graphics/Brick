Class {
	#name : #BrTextStylerSyncStrategy,
	#superclass : #BrTextStylerStrategy,
	#category : #'Brick-Editor-Styler'
}

{ #category : #styling }
BrTextStylerSyncStrategy >> style: aBlText afterDo: aBlock [
	| aStyledBlText |
	aStyledBlText := self styler onlyStyle: aBlText.
	self styler
		onlyFireStyledEventForText: aStyledBlText
		andAfterAction: aBlock.
]
