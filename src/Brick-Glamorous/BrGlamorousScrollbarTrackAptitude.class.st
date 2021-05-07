Class {
	#name : #BrGlamorousScrollbarTrackAptitude,
	#superclass : #BrStyleCommonAptitude,
	#category : #'Brick-Glamorous-Scrollbar'
}

{ #category : #initialization }
BrGlamorousScrollbarTrackAptitude >> initialize [
	super initialize.
	
	self default: [ :aStyle | aStyle background: (BrGlamorousColors defaultHeaderBackgroundColor) ].

	self add: (BrScrollbarOrientationAptitude new
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
