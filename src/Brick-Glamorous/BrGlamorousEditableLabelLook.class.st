Class {
	#name : #BrGlamorousEditableLabelLook,
	#superclass : #BrGlamorousEditorLook,
	#category : #'Brick-Glamorous-Editor'
}

{ #category : #initialization }
BrGlamorousEditableLabelLook >> initialize [
	super initialize.

	self
		add: (BrInteractiveCommonLook new
			default: [ :aWidget |
				aWidget geometry: (BlRectangle cornerRadius: 4).
				aWidget background: BrGlamorousColors neutralBackgroundColor.
				aWidget border: BlBorder empty.
				self foreground: Color veryDarkGray ];
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
