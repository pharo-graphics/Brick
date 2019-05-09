Class {
	#name : #BrGlamorousBreadcrumbLook,
	#superclass : #BrBreadcrumbLook,
	#category : #'Brick-Glamorous-Breadcrumb'
}

{ #category : #initialization }
BrGlamorousBreadcrumbLook >> initialize [
	super initialize.

	self add: BrLayoutResizerLook inherit.
	changes
		add: (#(widget layout)
		asBrLookPropertyChangeWithValue: [ BlLinearLayout horizontal alignCenterLeft ])
]
