"
I enable or disable TaskIt usage during a text attribute rendering.
"
Class {
	#name : #BrTextAdornmentAttributeUseTaskItRenderer,
	#superclass : #DynamicVariable,
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextAdornmentAttributeUseTaskItRenderer class >> enabled [
	"Answer if converting to TaskIt is enabled.
	The default is true."
	
	^ self value
		ifNil: [ true ]
		ifNotNil: [ :value | value ]
]
