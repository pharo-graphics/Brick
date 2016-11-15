installation
onInstalledIn: aWidget
	super onInstalledIn: aWidget.
	widget := aWidget.
	controller := widget controller.
	widget layout: self defaultLayout.
	self initializeSkin.
	self updateChildren
	
	