Class {
	#name : #BrCheckboxSkin,
	#superclass : #BrLabeledSkin,
	#instVars : [
		'box',
		'mark',
		'indeterminateMark',
		'checkedMark',
		'ripple',
		'rippleAnimation'
	],
	#category : 'Brick-UI-Checkbox'
}

{ #category : #accessing }
BrCheckboxSkin >> checkedMark [
	^ BrMdIcons checkSvg
]

{ #category : #initialization }
BrCheckboxSkin >> createBox [
	^ BrStackPane new
		size: 20 @ 20;
		margin: (BlInsets right: 3);
		clipChildren:false;
		styleClass: #box
]

{ #category : #'as yet unclassified' }
BrCheckboxSkin >> createMarkGraphics [
	| icon |
	icon := BlElement new.
	icon addStyleClass: #mark.
	icon background: Color black.
	icon constraints linear vertical alignCenter.
	icon constraints linear horizontal alignCenter.
	^ icon
]

{ #category : #accessing }
BrCheckboxSkin >> indeterminateMark [
	^ BrMdIcons checkIndeterminateSvg
]

{ #category : #initialization }
BrCheckboxSkin >> initializeBox [
	box := BrStackPane new.
	box size: 20 @ 20.
	box margin: (BlInsets right: 3).
	box styleClass: #box.
	mark := self createMarkGraphics.
	box addChild: mark.
	self markChanged
]

{ #category : #initialization }
BrCheckboxSkin >> initializeSkin [
	super initializeSkin.
	widget styleClass: #checkbox.
	box := self createBox.
	mark := self createMarkGraphics.

	widget checkedProperty onChangedDo: [ :aBoolean | self markChanged].
	widget indeterminateProperty onChangedDo: [ :aBoolean | self markChanged].
	
	self markChanged
]

{ #category : #'as yet unclassified' }
BrCheckboxSkin >> markChanged [
	 
	widget indeterminate
		ifTrue: [ mark geometry: self indeterminateMark; size: 20 @ 20.
			mark visibility: BlVisibility visible.
			controller activateState: BlIndeterminateState.
			^ self ].
	widget checked
		ifTrue: [ mark geometry: self checkedMark; size: 20 @ 20.
			mark visibility: BlVisibility visible.
			controller deactivateState: BlIndeterminateState.
			controller activateState: BlCheckedState.
			^ self ].
	mark visibility: BlVisibility hidden.
	controller deactivateState: BlIndeterminateState.
	controller deactivateState: BlCheckedState.
]

{ #category : #'mouse handlers' }
BrCheckboxSkin >> mouseUpEvent: anEvent [
	anEvent consumed: true.
	super mouseUpEvent: anEvent.
]

{ #category : #updating }
BrCheckboxSkin >> updateChildren [
	super updateChildren.
	
	self
		assert: [ mark parent isNil or: [ mark parent == box ] ]
		description: [ 'Mark must be a child of a box' ].
	
	self flag: 'Why do we need to re-add mark to box?'.
	mark parent == box
		ifTrue: [ box removeChild: mark ].

	box addChild: mark.
	widget addChildFirst: box
]
