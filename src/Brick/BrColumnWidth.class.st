"
! Column width

A column, while being abstract entity, should know how much of the available space it should take.

See ${class:BrColumnWidthExamples}$ for examples
"
Class {
	#name : #BrColumnWidth,
	#superclass : #Object,
	#category : #'Brick-Column - Model'
}

{ #category : #testing }
BrColumnWidth class >> isAbstract [
	^ self = BrColumnWidth
]

{ #category : #comparing }
BrColumnWidth >> = anObject [
	^ self subclassResponsibility
]

{ #category : #hook }
BrColumnWidth >> applyOn: anElement [
	^ self subclassResponsibility
]

{ #category : #comparing }
BrColumnWidth >> hash [
	^ self subclassResponsibility
]
