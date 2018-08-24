Class {
	#name : #BrSwitchSkin,
	#superclass : #BrLabeledSkin,
	#instVars : [
		'thumb',
		'bar',
		'box'
	],
	#category : 'Brick-UI-Switch'
}

{ #category : #'as yet unclassified' }
BrSwitchSkin >> createBar [
 ^  BlElement new
		size: 34@14;
		geometry: (BlRectangle cornerRadius: 20);
		background: Color gray;
		constraintsDo:[:c| 
			c frame vertical alignCenter.
			c frame horizontal alignCenter]
]

{ #category : #initialization }
BrSwitchSkin >> createBox [
	^ BrStackPane new
	 size: 36@24;
	 layout: BlFrameLayout new;
	 margin: (BlInsets right: 3).
	
]

{ #category : #'as yet unclassified' }
BrSwitchSkin >> createThumb [
 ^ (BlEllipse diameter: 20) asElement
		background: Color darkGray;
		constraintsDo:[:c| 
			c frame vertical alignCenter.
			c frame horizontal alignLeft ]
]

{ #category : #'as yet unclassified' }
BrSwitchSkin >> initializeSkin [
	super initializeSkin.
	widget styleClass:#switch.
	
	box := self createBox.
	bar := self createBar.
	thumb := self createThumb.
	
	widget checkedProperty onChangedDo: [ :aBoolean | self thumbChanged].
]

{ #category : #'as yet unclassified' }
BrSwitchSkin >> thumbChanged [
	widget checked
		ifTrue: [ thumb constraintsDo: [ :c | c frame horizontal alignRight ] ]
		ifFalse: [ thumb constraintsDo: [ :c | c frame horizontal alignLeft ] ]
]

{ #category : #'as yet unclassified' }
BrSwitchSkin >> updateChildren [
	super updateChildren.
	
	self
		assert: [ bar parent isNil or: [ bar parent == box ] ]
		description: [ 'Bar must be a child of a box' ].
	
	self flag: 'Why do we need to re-add bar to box?'.
	bar parent == box
		ifTrue: [ box removeChild: bar ].

	self
		assert: [ thumb parent isNil or: [ thumb parent == box ] ]
		description: [ 'Thumb must be a child of a box' ].
	
	self flag: 'Why do we need to re-add thumb to box?'.
	thumb parent == box
		ifTrue: [ box removeChild: thumb ].
	
	box addChildren: {bar.thumb}.
	widget addChildFirst: box.
]
