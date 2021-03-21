Class {
	#name : #BrGlamorousBreadcrumbLook,
	#superclass : #BrBreadcrumbLinearLook,
	#category : #'Brick-Glamorous-Breadcrumb'
}

{ #category : #initialization }
BrGlamorousBreadcrumbLook >> initialize [
	super initialize.
	self add: BrLayoutResizerLook inherit.
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout horizontal alignCenterLeft ]
]
