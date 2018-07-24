initialization
initializeListeners
	super initializeListeners.
	
	self when: BlMouseEnterEvent do: [ self widgetDo: [ :aWidget | aWidget background: (Color gray alpha: 0.1) ] ].
	self when: BlMouseLeaveEvent do: [ self widgetDo: [ :aWidget | aWidget background: Color transparent ] ]