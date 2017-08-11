accessing
replace: aBrText
	"Return a collection of objects (may be empty) that should replace a provided text piece"
	<return: #SequenceableCollection of: #Character or: #Object>

	^ BlElement new background: Color red; size: 70@40; yourself