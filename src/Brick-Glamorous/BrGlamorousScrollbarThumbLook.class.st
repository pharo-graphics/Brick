Class {
	#name : #BrGlamorousScrollbarThumbLook,
	#superclass : #BrStyleCommonLook,
	#category : #'Brick-Glamorous-Scrollbar'
}

{ #category : #initialization }
BrGlamorousScrollbarThumbLook >> initialize [
	super initialize.
	
	self default: [ :aStyle |
		aStyle background: (BrGlamorousColors defaultHeaderBackgroundColor).
		aStyle geometry: (BlRoundedRectangleGeometry cornerRadius: 3) ].

	self add: (BrScrollbarOrientationLook new
		horizontal: [ :aStyle | aStyle vExact: 6; hMatchParent ];
		vertical: [ :aStyle | aStyle hExact: 6; vMatchParent ])
]
