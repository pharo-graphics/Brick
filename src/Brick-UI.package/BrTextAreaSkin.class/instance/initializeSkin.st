initialization
initializeSkin
	super initializeSkin.
	widget wrapTextProperty onChangedDo: [ :b| self wrapTextChanged ]