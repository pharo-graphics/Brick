initialization
initialize
	super initialize.
	
	rowValues := #().
	rowStencil := [ :anObject :anElement | anElement ].
	selection := BlCompositeSelection new