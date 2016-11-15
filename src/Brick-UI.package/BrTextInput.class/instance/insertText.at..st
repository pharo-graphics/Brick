text operations
insertText: aString at: aPosition
	self textModel at: (self textModel positionAtTextIndex: aPosition) insert: aString.
	self textModelProperty notifyValueChanged