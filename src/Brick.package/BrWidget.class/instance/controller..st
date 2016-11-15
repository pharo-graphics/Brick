accessing
controller: aController
	self controller ifNotNil: [ :oldCtrl | oldCtrl onUninstalledIn: self ].
	controller := aController.
	aController onInstalledIn: self