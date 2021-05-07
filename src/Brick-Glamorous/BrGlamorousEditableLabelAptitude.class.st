Class {
	#name : #BrGlamorousEditableLabelAptitude,
	#superclass : #BrGlamorousEditorAptitude,
	#instVars : [
		'defaultBackground',
		'defaultForeground',
		'minWidth',
		'styleLook'
	],
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #accessing }
BrGlamorousEditableLabelAptitude >> defaultBackground [
	^ defaultBackground
]

{ #category : #accessing }
BrGlamorousEditableLabelAptitude >> defaultBackground: anObject [
	defaultBackground := anObject.
	styleLook 
		default: [ :aStyle |
			aStyle background: self defaultBackground ];
		when: [ :aState | aState hovered and: BrEditorModeState readOnly ]
			style: [ :aStyle | aStyle background: self defaultBackground darker ].
]

{ #category : #accessing }
BrGlamorousEditableLabelAptitude >> defaultForeground [
	^ defaultForeground
]

{ #category : #accessing }
BrGlamorousEditableLabelAptitude >> defaultForeground: anObject [
	defaultForeground := anObject
]

{ #category : #initialization }
BrGlamorousEditableLabelAptitude >> initialize [
	super initialize.
	
	defaultBackground := BrGlamorousColors neutralBackgroundColor.
	defaultForeground := Color black.
	minWidth := 20.

	self
		addChangeProperty: #(widget constraints minWidth)
		with: [ self minWidth ].

	self
		add: (styleLook := BrStyleCommonAptitude new
			default: [ :aStyle |
				aStyle geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
				aStyle background: self defaultBackground.
				aStyle border: BlBorder empty ];
			when: BrEditorModeState editable
				style: [ :aStyle | aStyle background: Color white ];
			when: [ :aState | aState focused not and: BrEditorModeState editable ]
				style: [ :aStyle | aStyle border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1) ];
			when: [ :aState | aState focused and: BrEditorModeState editable ]
				style: [ :aStyle | aStyle border: (BlBorder paint: BrGlamorousColors focusedEditorBorderColor width: 1) ];
			when: [ :aState | aState hovered and: BrEditorModeState readOnly ]
				style: [ :aStyle | aStyle background: self defaultBackground darker ];
			when: [ :aState | aState focused and: BrEditorModeState readOnly ]
				style: [ :aStyle |
					aStyle background: BrGlamorousColors focusedEditorBorderColor.
					aStyle do: [ self foreground: Color white ] after: [ self foreground: self defaultForeground ] ])
]

{ #category : #initialization }
BrGlamorousEditableLabelAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BlClickEvent do: [ :anEvent | anEvent currentTarget dispatchEvent: (BlElementSelectedStateWish selected: true) ]
]

{ #category : #accessing }
BrGlamorousEditableLabelAptitude >> minWidth [
	^ minWidth
]

{ #category : #accessing }
BrGlamorousEditableLabelAptitude >> minWidth: anObject [
	minWidth := anObject
]
