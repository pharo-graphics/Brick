Extension { #name : #FileReference }

{ #category : #'*Brick-Editor-Extensions' }
FileReference >> gtContentsIn: anElement [
	| contents textElement |
	contents := self readStreamDo: [ :stream | 
		| result |
		result := [stream contents ]
			on: Error 
			do: [ (stream binary next: 10000) asString ] ].
	textElement := BlTextElement new text: contents asRopedText.
	anElement addChild: textElement.
	^ textElement
]
