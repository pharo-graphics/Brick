Class {
	#name : #BrScrollbarAptitude,
	#superclass : #BrBasicScrollbarAptitude,
	#category : #'Brick-Scrollbar - Look'
}

{ #category : #initialization }
BrScrollbarAptitude >> initialize [
	super initialize.
	
	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ].
	
	self add: (BrScrollbarOrientationAptitude new
		horizontal: [ :aStyle | aStyle vFitContent; hMatchParent ];
		vertical: [ :aStyle | aStyle vMatchParent; hFitContent ])
]
