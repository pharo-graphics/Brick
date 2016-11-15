as yet unclassified
initializeSkin
	super initializeSkin.
	widget styleClass: #radio.
	box := self createBox.
	mark := self createMark.
	
	widget selectedProperty onChangedDo: [ :aBoolean | self markChanged ].
	self markChanged