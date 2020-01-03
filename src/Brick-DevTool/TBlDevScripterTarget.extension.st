Extension { #name : #TBlDevScripterTarget }

{ #category : #'*Brick-DevTool' }
TBlDevScripterTarget >> onBrButtonName: aButtonLabel [
	self updateTarget: (BrDevScripterButtonWithLabelChildEventTarget new buttonLabel: aButtonLabel)
]

{ #category : #'*Brick-DevTool' }
TBlDevScripterTarget >> onBrTextEditor [
	self onChildFromMessage: #editor
]

{ #category : #'*Brick-DevTool' }
TBlDevScripterTarget >> onBrTextEditorText [
	self onChildFromMessage: #text
]
