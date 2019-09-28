Class {
	#name : #BrDescriptionChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'text'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #accessing }
BrDescriptionChanged >> text [
	<return: #BlText or: #String>

	^ text
]

{ #category : #accessing }
BrDescriptionChanged >> text: aBrTextOrString [
	self
		assert: [ aBrTextOrString isNotNil ]
		description: [ 'Text must not be nil' ].

	text := aBrTextOrString
]
