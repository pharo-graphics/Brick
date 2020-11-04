Class {
	#name : #BrGlamorousEditableLabelLook,
	#superclass : #BrGlamorousEditorLook,
	#instVars : [
		'defaultBackground',
		'defaultForeground'
	],
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #accessing }
BrGlamorousEditableLabelLook >> defaultBackground [
	^ defaultBackground
]

{ #category : #accessing }
BrGlamorousEditableLabelLook >> defaultBackground: anObject [
	defaultBackground := anObject
]

{ #category : #accessing }
BrGlamorousEditableLabelLook >> defaultForeground [
	^ defaultForeground
]

{ #category : #accessing }
BrGlamorousEditableLabelLook >> defaultForeground: anObject [
	defaultForeground := anObject
]

{ #category : #initialization }
BrGlamorousEditableLabelLook >> initialize [
	super initialize.
	
	defaultBackground := BrGlamorousColors neutralBackgroundColor.
	defaultForeground := Color black.

	self
		addChangeProperty: #(widget constraints minWidth)
		with: [ 20 ].

	self
		add: (BrInteractiveCommonLook new
			default: [ :aWidget |
				aWidget geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
				aWidget background: self defaultBackground.
				aWidget border: BlBorder empty.
				self foreground: self defaultForeground ];
			when: BrEditorModeState editable
				style: [ :aWidget | aWidget background: Color white ];
			when: (BrInteractionState focused not and: BrEditorModeState editable)
				style: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors editorBorderColor width: 1) ];
			when: (BrInteractionState focused and: BrEditorModeState editable)
				style: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors focusedEditorBorderColor width: 1) ];
			when: (BrInteractionState hovered and: BrEditorModeState readOnly)
				style: [ :aWidget | aWidget background: BrGlamorousColors neutralBackgroundColor darker ];
			when: (BrInteractionState focused and: BrEditorModeState readOnly)
				style: [ :aWidget |
					aWidget background: BrGlamorousColors focusedEditorBorderColor.
					self foreground: Color white ])
]

{ #category : #initialization }
BrGlamorousEditableLabelLook >> initializeListeners [
	super initializeListeners.
	
	self when: BlClickEvent do: [ :anEvent | anEvent currentTarget dispatchEvent: (BrSelectedWish selected: true) ]
]
