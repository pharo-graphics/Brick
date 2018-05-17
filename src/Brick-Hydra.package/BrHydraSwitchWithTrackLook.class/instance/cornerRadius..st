accessing
cornerRadius: aNumber
	cornerRadius := aNumber.
	self widgetDo: [ self updateCornerRadius ]