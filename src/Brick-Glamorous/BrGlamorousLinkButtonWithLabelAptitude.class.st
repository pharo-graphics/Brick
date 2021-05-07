"
I define a link button that represents a link (in a text document).
"
Class {
	#name : #BrGlamorousLinkButtonWithLabelAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Glamorous-Buttons'
}

{ #category : #initialization }
BrGlamorousLinkButtonWithLabelAptitude >> initialize [
	super initialize.
	
	self addAll: {
		BrGlamorousLinkButtonLabelAptitude new
			labelDo: [ :aLabelElement |
				aLabelElement padding: (BlInsets all: 0) ].
		BrGlamorousLinkButtonExteriorAptitude new.
	}
]
