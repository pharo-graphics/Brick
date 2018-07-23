api - hooks
onInstalledIn: anElement
	super onInstalledIn: anElement.

	self
		assert: [ widget isNil ]
		description: [ 'Can not install the same look instance on multiple widgets' ].

	widget := anElement.

	self initializeListeners.
	self initializeLook.
	"we must send events after look initialization where we set defaults"
	self initializeRequests.
	
	self looks do: [ :aLook | aLook onInstalledIn: anElement ].

	
	self postInitialize