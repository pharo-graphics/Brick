Class {
	#name : #BrTextStylerStrategy,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'styler'
	],
	#category : #'Brick-Editor-Styler'
}

{ #category : #styling }
BrTextStylerStrategy >> style: aBrText [
	self style: aBrText afterDo: [ "do nothing" ]
]

{ #category : #styling }
BrTextStylerStrategy >> style: aBlText afterDo: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
BrTextStylerStrategy >> styler [
	<return: #BlTextStyler>
	^ styler
]

{ #category : #accessing }
BrTextStylerStrategy >> styler: aBlTextStyler [
	self 
		assert: [ aBlTextStyler isNotNil ] 
		description: [ 'Text styler must be non-nil' ].
	styler := aBlTextStyler
]

{ #category : #accessing }
BrTextStylerStrategy >> view [
	"Strategies that need an widget to which the text editor (and therefore the styler) is attached to, can override the method"
	<return: #BlElement or: nil>
	^ nil
]

{ #category : #accessing }
BrTextStylerStrategy >> view: aBlElement [
	"Strategies that need an widget to which the text editor (and therefore the styler) is attached to, can override the method"

]
