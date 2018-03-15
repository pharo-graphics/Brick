initialization
initializeListeners
	"Override me to initialize event listeners such as property updates from the view model"
	
	self when: BrViewModelAttached do: [ self initializeRequests ]