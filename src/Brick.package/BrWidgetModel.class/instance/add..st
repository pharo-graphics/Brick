api - composition
add: aBrWidgetModel
	self widgetModels add: aBrWidgetModel.
	self widgetDo: [ :anElement | aBrWidgetModel onInstalledIn: anElement ]