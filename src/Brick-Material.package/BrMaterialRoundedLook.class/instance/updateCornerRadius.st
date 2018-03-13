updating
updateCornerRadius
	self widgetDo: [ :anElement | anElement geometry: (BlRectangle cornerRadius: self cornerRadius) ]