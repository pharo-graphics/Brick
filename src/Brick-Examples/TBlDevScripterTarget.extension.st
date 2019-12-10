Extension { #name : #TBlDevScripterTarget }

{ #category : #'*Brick-Examples' }
TBlDevScripterTarget >> onBrButtonName: aButtonLabel [
	self updateTarget: (BrDevScripterButtonWithLabelChildEventTarget new buttonLabel: aButtonLabel)
]
