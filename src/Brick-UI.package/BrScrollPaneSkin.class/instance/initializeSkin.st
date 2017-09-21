as yet unclassified
initializeSkin
	super initializeSkin.
	vbar := self createVScrollBar.
	hbar := self createHScrollBar.
	viewport := self createViewport.
	
	hbar scrollValueProperty onChangedDo: [ :v | self updatePositionX ].
	vbar scrollValueProperty onChangedDo: [ :v | self updatePositionY ].
	
	widget hValueProperty onChangedDo: [ :v | hbar scrollValue: v ].
	widget hMinProperty onChangedDo: [ :v | hbar min: v ].
	widget hMaxProperty onChangedDo: [ :v | hbar max: v ].
	widget vValueProperty onChangedDo: [ :v | vbar scrollValue: v ].
	widget vMinProperty onChangedDo: [ :v | vbar min: v ].
	widget vMaxProperty onChangedDo: [ :v | vbar max: v ].
	widget withButtonsProperty onChangedDo: [ :v |  hbar withButtons: v. vbar withButtons: v ].
	widget contentProperty onChangedDo:[
		viewport removeChildren;addChild: widget content.
		self updateHScrollBar; updateVScrollBar.
		hbar maxWidth: viewport width.
		vbar maxWidth: viewport height.].
	"widget extentProperty onChangedDo:[
		self updateHScrollBar; updateVScrollBar.
		hbar maxWidth: viewport width.
		vbar maxWidth: viewport height.]."
	widget requestLayout