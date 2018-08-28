Class {
	#name : #BrStateModel,
	#superclass : #BrWidgetModel,
	#category : #'Brick-! Core'
}

{ #category : #streaming }
BrStateModel >> streamStateOn: aStream [
	self subclassResponsibility
]
