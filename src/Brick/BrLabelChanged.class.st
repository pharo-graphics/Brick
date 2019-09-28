"
I am sent when label in a view model is changed
"
Class {
	#name : #BrLabelChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'text'
	],
	#category : 'Brick-! Core - Events'
}

{ #category : #accessing }
BrLabelChanged >> text [
	<return: #BlText or: #String>

	^ text
]

{ #category : #accessing }
BrLabelChanged >> text: aBrTextOrString [
	self
		assert: [ aBrTextOrString isNotNil ]
		description: [ 'Text must not be nil' ].

	text := aBrTextOrString
]
