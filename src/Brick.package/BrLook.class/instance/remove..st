api - composition
remove: aBrLook
	| aLookInstance |

	aLookInstance := aBrLook asLook.
	self looks remove: aLookInstance ifAbsent: [  ]