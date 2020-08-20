"
BrColumnedListHeaderLook adds a header row to a BrColumnedList.

- All columns are assumed to have a title.
- The look must be added after the columns have been defined.
- The header row is constructed as a BrHorizontalPane containing the header labels and inserted as the first child of the columned list.
"
Class {
	#name : #BrColumnedListHeaderLook,
	#superclass : #BrLook,
	#category : #'Brick-List - Look'
}

{ #category : #private }
BrColumnedListHeaderLook >> headerPane [
	| headerPane |

	headerPane := BrHorizontalPane new
			padding: (BlInsets bottom: 5);
			hMatchParent;
			vFitContent.

	widget viewModel columnsDo: [ :aColumn | | label |
		label := BrLabel new look: BrGlamorousLabelLook.
		label text: (aColumn title asRopedText foreground: BrGlamorousColors defaultButtonTextColor).
		aColumn width applyOn: label.
		headerPane addChild: label. ].

	^ headerPane
]

{ #category : #initialization }
BrColumnedListHeaderLook >> initialize [ 

	super initialize.
	self addChangeAddChildFirst: #() with: 
		[ self headerPane ].
]
