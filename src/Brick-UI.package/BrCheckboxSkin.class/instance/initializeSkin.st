initialization
initializeSkin
	super initializeSkin.
	widget styleClass: #checkbox.
	box := self createBox.
	mark := self createMarkGraphics.

	widget checkedProperty onChangedDo: [ :aBoolean | self markChanged].
	widget indeterminateProperty onChangedDo: [ :aBoolean | self markChanged].
	
	self markChanged