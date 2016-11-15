text operations
appendText: aString
	self textModel endPosition insert:aString.
	self textModelProperty notifyValueChanged