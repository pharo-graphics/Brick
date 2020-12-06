Class {
	#name : #BrScrollbarLook,
	#superclass : #BrBasicScrollbarLook,
	#category : #'Brick-Scrollbar - Look'
}

{ #category : #initialization }
BrScrollbarLook >> initialize [
	super initialize.
	
	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ].
	
	self add: (BrScrollbarOrientationLook new
		horizontal: [ :aStyle | aStyle vFitContent; hMatchParent ];
		vertical: [ :aStyle | aStyle vMatchParent; hFitContent ])
]
