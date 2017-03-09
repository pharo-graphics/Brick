initialization
initializeSkin
	super initializeSkin.
	widget constraints horizontal fitContent.
	widget constraints vertical fitContent. .
	widget minExtent: 25 @ 25.
	widget border: (BlBorder paint: Color veryVeryLightGray width: 1).
	widget  background: (BlBackground fill: Color white).
	innerContainer := self createInnerContainer.
	textContainer := self createTextContainer.
	
	text := self createGraphicsText.
	placeholderText := self createPlaceholderShape.
	caret := BrCaretCursor new position: 20 @ 0.
	selectionShapes := OrderedCollection new.
	
	widget textModelProperty onChangedDo: [ self textModelChanged ].
	widget editorModelProperty onChangedDo: [ self caretChanged ].
	widget fontFamilyProperty onChangedDo: [ self fontChanged ].
	widget fontSizeProperty onChangedDo: [ self fontChanged ].
	widget fontColorProperty onChangedDo: [ self fontChanged ].
	widget highlightColorProperty onChangedDo: [ self highlightChanged ].
	widget highlightFontColorProperty onChangedDo: [ self highlightChanged ].
	widget selectionProperty onChangedDo: [ self caretChanged. self selectionChanged ].	
	widget placeholderProperty onChangedDo: [ :v | placeholderText text: v ].
	innerContainer geomBoundsProperty onChangedDo: [ :v | self extentChanged ].
	"force the textContainer extent to be the same as the text extent to be larger than its parent"
	text extentProperty onChangedDo:[:v|  self textExtentChanged]