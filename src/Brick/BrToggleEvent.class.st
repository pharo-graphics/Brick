Class {
	#name : #BrToggleEvent,
	#superclass : #BlEvent,
	#instVars : [
		'toggle'
	],
	#category : 'Brick-Toggle - Events'
}

{ #category : #'instance creation' }
BrToggleEvent class >> toggle: aBrToggleModel [
	^ self new toggle: aBrToggleModel
]

{ #category : #accessing }
BrToggleEvent >> toggle [
	<return: #BrToggleModel>
	^ toggle
]

{ #category : #accessing }
BrToggleEvent >> toggle: aBrToggleModel [
	toggle := aBrToggleModel
]
