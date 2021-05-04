"
Futuristic switches inspired by Hydra UI (https://creativemarket.com/MehmetRehaTugcu/363101-Hydra-UI)
"
Class {
	#name : #BrHydraSwitchAptitude,
	#superclass : #BrToggleAptitude,
	#instVars : [
		'color'
	],
	#category : #'Brick-Hydra'
}

{ #category : #accessing }
BrHydraSwitchAptitude >> color [
	^ color
]

{ #category : #accessing }
BrHydraSwitchAptitude >> color: aColor [
	color := aColor.
	self widgetDo: [ self updateColor ]
]

{ #category : #initialization }
BrHydraSwitchAptitude >> defaultColor [
	^ Color gray
]

{ #category : #initialization }
BrHydraSwitchAptitude >> initialize [
	super initialize.
	
	color := self defaultColor
]

{ #category : #updating }
BrHydraSwitchAptitude >> updateColor [
]
