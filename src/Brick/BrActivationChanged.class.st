"
I am sent when the activation status (enabled / disabled) of the widget is changed
"
Class {
	#name : #BrActivationChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'enabled'
	],
	#category : 'Brick-! Core - Events'
}

{ #category : #'instance creation' }
BrActivationChanged class >> enabled: aBoolean [
	^ self new enabled: aBoolean
]

{ #category : #accessing }
BrActivationChanged >> enabled [
	<return: #Boolean>

	^ enabled
]

{ #category : #accessing }
BrActivationChanged >> enabled: aBoolean [
	enabled := aBoolean
]
