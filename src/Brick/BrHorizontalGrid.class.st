Class {
	#name : #BrHorizontalGrid,
	#superclass : #BrWidgetContainer,
	#category : #'Brick-Layout Widgets'
}

{ #category : #accessing }
BrHorizontalGrid >> cellSpacing: aNumber [
	self layoutDo: [ :l | l cellSpacing: aNumber ]
]

{ #category : #accessing }
BrHorizontalGrid >> columnCount: aNumber [
	self layoutDo: [ :l | l columnCount: aNumber ]
]

{ #category : #initialization }
BrHorizontalGrid >> initialize [
	super initialize.
	
	self layout: BlGridLayout horizontal.
	self look: BrHorizontalGridLook new
]
