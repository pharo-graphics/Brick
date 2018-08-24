"
Futuristic switches inspired by Hydra UI (https://creativemarket.com/MehmetRehaTugcu/363101-Hydra-UI)
"
Class {
	#name : #BrHydraSwitchLook,
	#superclass : #BrToggleLook,
	#instVars : [
		'color'
	],
	#category : 'Brick-Hydra'
}

{ #category : #accessing }
BrHydraSwitchLook >> color [
	^ color
]

{ #category : #accessing }
BrHydraSwitchLook >> color: aColor [
	color := aColor.
	self widgetDo: [ self updateColor ]
]

{ #category : #initialization }
BrHydraSwitchLook >> defaultColor [
	^ Color gray
]

{ #category : #initialization }
BrHydraSwitchLook >> initialize [
	super initialize.
	
	color := self defaultColor
]

{ #category : #updating }
BrHydraSwitchLook >> updateColor [
]
