Class {
	#name : #BrGlamorousBreadcrumbAptitude,
	#superclass : #BrBreadcrumbLinearAptitude,
	#category : #'Brick-Glamorous-Breadcrumb'
}

{ #category : #initialization }
BrGlamorousBreadcrumbAptitude >> initialize [
	super initialize.
	self add: BrLayoutResizerAptitude inherit.
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout horizontal alignCenterLeft ]
]
