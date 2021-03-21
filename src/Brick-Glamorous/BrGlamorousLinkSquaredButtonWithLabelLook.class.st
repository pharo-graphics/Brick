"
BrGlamorousLinkSquaredButtonWithLabelLook by default creates a button that is borderless with a grey background and code font.

The font attributes, e.g. emphasis, font, orientation, style and weight, can all be modified.  Convenience methods for common attributes are available, e.g. to use the regular font instead of the code font: 

[[[ 
aWidget look:
	BrGlamorousLinkSquaredButtonWithLabelLook new glamorousRegularFont
]]]
"
Class {
	#name : #BrGlamorousLinkSquaredButtonWithLabelLook,
	#superclass : #BrLook,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#instVars : [
		'labelLook'
	],
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #accessing }
BrGlamorousLinkSquaredButtonWithLabelLook >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ labelLook attributesBuilder
]

{ #category : #'api - text font' }
BrGlamorousLinkSquaredButtonWithLabelLook >> fontSize: aNumber [
	labelLook fontSize: aNumber
]

{ #category : #initialization }
BrGlamorousLinkSquaredButtonWithLabelLook >> initialize [
	super initialize.
	
	self addAll: {
		labelLook := BrGlamorousLinkButtonLabelLook new
			labelDo: [ :aLabelElement |
				aLabelElement padding: (BlInsets all: 0) ].
		BrGlamorousLinkButtonExteriorInnerLook new.
	}
]
