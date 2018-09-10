"
I describe how background of a material toggle button changes due to toggle events
"
Class {
	#name : #BrMaterialToggleBackgroundLook,
	#superclass : #BrToggleLook,
	#instVars : [
		'normalBackground',
		'checkedBackground'
	],
	#category : #'Brick-Material-! Core'
}

{ #category : #accessing }
BrMaterialToggleBackgroundLook >> checkedBackground [
	^ checkedBackground
]

{ #category : #accessing }
BrMaterialToggleBackgroundLook >> checkedBackground: aBackground [
	checkedBackground := aBackground
]

{ #category : #initialization }
BrMaterialToggleBackgroundLook >> defaultCheckedBackground [
	^ Color fromHexString: 'e5e5e5'
]

{ #category : #initialization }
BrMaterialToggleBackgroundLook >> defaultNormalBackground [
	^ Color fromHexString: 'fafafa'
]

{ #category : #initialization }
BrMaterialToggleBackgroundLook >> initialize [
	super initialize.
	
	self add: (BrInteractiveLook new
		style: [ :aStyler |
			aStyler default: [ :aWidget | aWidget background: self defaultNormalBackground ].
			aStyler pressed: [ :aWidget | aWidget background: self defaultCheckedBackground slightlyLighter ] ]).

	normalBackground := self defaultNormalBackground.
	checkedBackground := self defaultCheckedBackground
]

{ #category : #accessing }
BrMaterialToggleBackgroundLook >> normalBackground [
	^ normalBackground
]

{ #category : #'event handling' }
BrMaterialToggleBackgroundLook >> toggleActivated [
	super toggleActivated.
	
	widget background: self checkedBackground
]

{ #category : #'event handling' }
BrMaterialToggleBackgroundLook >> toggleDeactivated [
	super toggleDeactivated.
	
	widget background: self normalBackground
]
