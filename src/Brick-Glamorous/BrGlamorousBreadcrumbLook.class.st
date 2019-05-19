Class {
	#name : #BrGlamorousBreadcrumbLook,
	#superclass : #BrBreadcrumbLook,
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
