as yet unclassified
initializeSkin
	super initializeSkin.
	widget styleClass:#switch.
	
	box := self createBox.
	bar := self createBar.
	thumb := self createThumb.
	
	widget checkedProperty onChangedDo: [ :aBoolean | self thumbChanged].