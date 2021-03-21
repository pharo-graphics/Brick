Class {
	#name : #BrGlamorousScrollbarTrackLook,
	#superclass : #BrStyleCommonLook,
	#category : #'Brick-Glamorous-Scrollbar'
}

{ #category : #initialization }
BrGlamorousScrollbarTrackLook >> initialize [
	super initialize.
	
	self default: [ :aStyle | aStyle background: (BrGlamorousColors defaultHeaderBackgroundColor) ].

	self add: (BrScrollbarOrientationLook new
		horizontal: [ :aStyle |
			aStyle vExact: 1; hMatchParent.
			aStyle
				do: [ :anElement | anElement constraintsDo: [ :c | c frame vertical alignCenter ] ]
				after: [  ] ];
		vertical: [ :aStyle |
			aStyle vMatchParent; hExact: 1.
			aStyle
				do: [ :anElement | anElement constraintsDo: [ :c | c frame horizontal alignCenter ] ]
				after: [  ] ])
]
