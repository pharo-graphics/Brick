accessing
layout: aBlLayout
	layout := aBlLayout.
	
	self widgetDo: [ :anElement | self targetElement layout: self layout ]