Class {
	#name : #BrGlamorousBreadcrumbLook,
	#superclass : #BrBreadcrumbLook,
	#category : #'Brick-Glamorous-Breadcrumb'
}

{ #category : #initialization }
BrGlamorousBreadcrumbLook >> initialize [
	super initialize.
	
	self addAll: { 
		BrLayoutLook linearHorizontal fitContent
	}
]
