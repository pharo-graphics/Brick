accessing
affect: aBrText in: aBrEditor
	"Return a collection of objects (may be empty) that should affect (either append or replace) a provided text piece"
	<return: #SequenceableCollection of: #BlElement>

	^ self subclassResponsibility