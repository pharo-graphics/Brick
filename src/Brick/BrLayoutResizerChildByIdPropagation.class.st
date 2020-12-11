Class {
	#name : #BrLayoutResizerChildByIdPropagation,
	#superclass : #BrLayoutResizerPropagation,
	#instVars : [
		'childId'
	],
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #accessing }
BrLayoutResizerChildByIdPropagation >> childId [
	<return: #BlElementId>

	^ childId
]

{ #category : #accessing }
BrLayoutResizerChildByIdPropagation >> childId: aBlElementId [
	childId := aBlElementId asBlocElementId
]

{ #category : #accessing }
BrLayoutResizerChildByIdPropagation >> childrenToPropagateFrom: aParentElement do: aBlockClosure [
	aParentElement
		childWithId: self childId
		ifFound: [ :aPotentialChild |
			(aParentElement hasChild: aPotentialChild)
				ifTrue: [ aBlockClosure value: aPotentialChild ] ]
		ifNone: [ ]
]
