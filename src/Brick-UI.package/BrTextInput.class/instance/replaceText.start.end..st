text operations
replaceText: aString start: aStartPosition end: aEndPostion
	((self textModel positionAtTextIndex: aStartPosition)
		selectTo: (self textModel positionAtTextIndex: aEndPostion)) replaceWith: aString.
		self textModelProperty notifyValueChanged