Class {
	#name : #BrToolbar,
	#superclass : #BrWidget,
	#category : 'Brick-Experimental-Toolbar'
}

{ #category : #'as yet unclassified' }
BrToolbar >> defaultController [
	^ BrToolbarController new 
]

{ #category : #'as yet unclassified' }
BrToolbar >> defaultSkin [
	^ BrToolbarSkin new
]
