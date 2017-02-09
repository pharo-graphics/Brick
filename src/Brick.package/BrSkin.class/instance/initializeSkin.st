initialization
initializeSkin
	widget borderColorProperty onChangedDo: [ self borderChanged ].
	widget borderWidthProperty onChangedDo: [ self borderChanged ].
	widget backgroundColorProperty onChangedDo: [ self backgroundChanged ]