"
I arrange my children in one vertical column, one by one
"
Class {
	#name : #BrVerticalPane,
	#superclass : #BrWidgetContainer,
	#category : #'Brick-Layout Widgets'
}

{ #category : #accessing }
BrVerticalPane >> cellSpacing: aNumber [
	self layoutDo: [ :l | l cellSpacing: aNumber ]
]

{ #category : #initialization }
BrVerticalPane >> initialize [
	super initialize.
	
	self layout: BlLinearLayout vertical.
	self aptitude: BrVerticalPaneAptitude new
]

{ #category : #accessing }
BrVerticalPane >> weightSum: aNumber [
	self layoutDo: [ :l | l weightSum: aNumber ]
]
