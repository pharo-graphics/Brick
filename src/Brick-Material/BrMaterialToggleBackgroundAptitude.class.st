"
I describe how background of a material toggle button changes due to toggle events
"
Class {
	#name : #BrMaterialToggleBackgroundAptitude,
	#superclass : #BrToggleAptitude,
	#instVars : [
		'normalBackground',
		'checkedBackground'
	],
	#category : #'Brick-Material-! Core'
}

{ #category : #accessing }
BrMaterialToggleBackgroundAptitude >> checkedBackground [
	^ checkedBackground
]

{ #category : #accessing }
BrMaterialToggleBackgroundAptitude >> checkedBackground: aBackground [
	checkedBackground := aBackground
]

{ #category : #initialization }
BrMaterialToggleBackgroundAptitude >> defaultCheckedBackground [
	^ Color fromHexString: 'e5e5e5'
]

{ #category : #initialization }
BrMaterialToggleBackgroundAptitude >> defaultNormalBackground [
	^ Color fromHexString: 'fafafa'
]

{ #category : #initialization }
BrMaterialToggleBackgroundAptitude >> initialize [
	super initialize.
	
	self add: (BrInteractiveAptitude new
		style: [ :aStyler |
			aStyler default: [ :aWidget | aWidget background: self defaultNormalBackground ].
			aStyler pressed: [ :aWidget | aWidget background: self defaultCheckedBackground slightlyLighter ] ]).

	normalBackground := self defaultNormalBackground.
	checkedBackground := self defaultCheckedBackground
]

{ #category : #accessing }
BrMaterialToggleBackgroundAptitude >> normalBackground [
	^ normalBackground
]

{ #category : #'event handling' }
BrMaterialToggleBackgroundAptitude >> toggleActivated [
	super toggleActivated.
	
	widget background: self checkedBackground
]

{ #category : #'event handling' }
BrMaterialToggleBackgroundAptitude >> toggleDeactivated [
	super toggleDeactivated.
	
	widget background: self normalBackground
]
