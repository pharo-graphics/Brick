initialization
initializeSkin
	super initializeSkin.
	text := BlText new
	 	styleClass: #text;
		zIndex:20.
	"text constraints horizontal matchParent."
	widget constraints horizontal fitContent.
	widget constraints vertical fitContent.
	widget minExtent: 25@25.
	text margin: (BlInsets top: 6 right: 6 bottom: 3 left: 6).
	widget textProperty onChangedDo: [ self textChanged ].
	widget iconProperty onChangedDo: [ self graphicChanged ].
	widget fontFamilyProperty onChangedDo: [ self fontChanged ].
	widget fontSizeProperty onChangedDo: [ self fontChanged ].
	widget fontColorProperty onChangedDo: [ self fontChanged ].
	