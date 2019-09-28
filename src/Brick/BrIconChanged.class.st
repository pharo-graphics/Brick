"
I am sent when icon in a view model is changed
"
Class {
	#name : #BrIconChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'icon'
	],
	#category : 'Brick-! Core - Events'
}

{ #category : #accessing }
BrIconChanged >> icon [
	<return: #BlElement>

	^ icon
]

{ #category : #accessing }
BrIconChanged >> icon: anElement [
	self
		assert: [ anElement isNotNil ]
		description: [ 'Icon must not be nil' ].
		
	icon := anElement
]
