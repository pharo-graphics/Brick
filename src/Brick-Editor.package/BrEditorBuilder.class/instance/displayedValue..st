builder - accessing
displayedValue: anObject
	"Return a transformed object that should be edited in the editor.
	anObject is an entity object editor was initially opened on"
	<return: #Object>

	^ displayBlock cull: anObject