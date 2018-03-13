initialization
initialize
	super initialize.
	
	"default icon"
	iconElement := BlElement new.
	iconElement size: 6@6.
	iconElement background: Color red.
	iconElement geometry: BlEllipse new.