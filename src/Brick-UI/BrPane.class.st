Class {
	#name : #BrPane,
	#superclass : #BrWidget,
	#category : 'Brick-UI-LayoutPane'
}

{ #category : #'as yet unclassified' }
BrPane >> defaultController [
	^ BrInteractiveController new 
]

{ #category : #'as yet unclassified' }
BrPane >> defaultSkin [
	^ BrSkin new
]

{ #category : #'as yet unclassified' }
BrPane >> initializeWidget [
	super initializeWidget.
	self background: (BlBackground paint: Color white)
]

{ #category : #'as yet unclassified' }
BrPane >> layoutDo: aBlock [
	layout ifNotNil: [ :l | aBlock value: l ]
]
