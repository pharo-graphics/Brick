Class {
	#name : #BrGridPane,
	#superclass : #BrPane,
	#category : 'Brick-UI-LayoutPane'
}

{ #category : #'as yet unclassified' }
BrGridPane >> cellSpacing: aNumber [
	self layout cellSpacing: aNumber
]

{ #category : #'as yet unclassified' }
BrGridPane >> columnCount: aNumber [
	self layout columnCount: aNumber
]

{ #category : #'as yet unclassified' }
BrGridPane >> defaultLayout [
	^ BlGridLayout new alignMargins.
]

{ #category : #'as yet unclassified' }
BrGridPane >> rowCount: aNumber [
	self layout rowCount: aNumber
]
