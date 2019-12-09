Extension { #name : #TBlDevScripterTarget }

{ #category : #'*Brick-Examples' }
TBlDevScripterTarget >> onBrButtonName: aButtonLabel [
	self onChildFromSelectionBlock: [ :aChild | aChild class = BrButton and: [ aChild label asString = aButtonLabel ] ]
]
