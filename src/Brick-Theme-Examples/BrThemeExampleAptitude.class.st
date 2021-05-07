Class {
	#name : #BrThemeExampleAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Theme-Examples-Brick-Theme-Examples'
}

{ #category : #accessing }
BrThemeExampleAptitude >> initialize [
	super initialize.
	self addChangeProperty: #(widget layout) with: BlLinearLayout vertical.
	self addChangeProperty: #(widget padding) with: (BlInsets all: 5).
	self addChangeProperty: #(widget background) with: Color blue asBlPaint.
	self
		addChangeProperty: #(widget border)
		with: (BlBorder paint: Color red asBlPaint width: 3)
]
