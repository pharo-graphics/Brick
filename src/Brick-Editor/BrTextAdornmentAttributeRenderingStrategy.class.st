Class {
	#name : #BrTextAdornmentAttributeRenderingStrategy,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'attribute'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextAdornmentAttributeRenderingStrategy >> affect: aBrText in: anEditorElement [
	"Return an element that should affect (either append or replace) a provided text piece"
	<return: #BlElement>
	^ self subclassResponsibility 
]

{ #category : #accessing }
BrTextAdornmentAttributeRenderingStrategy >> attribute [
	<return: #BrTextAdornmentAttribute>
	^ attribute
]

{ #category : #accessing }
BrTextAdornmentAttributeRenderingStrategy >> attribute: aBrTextAdornmentAttribute [
	self 
		assert: [ aBrTextAdornmentAttribute isNotNil ] 
		description: [ 'Attribute must be non-nil' ].
	attribute := aBrTextAdornmentAttribute
]
