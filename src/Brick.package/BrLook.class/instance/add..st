api - composition
add: aBrLook
	| aLookInstance |

	aLookInstance := aBrLook asLook.
	self looks add: aLookInstance.
	self widgetDo: [ :anElement | aLookInstance onInstalledIn: anElement ]