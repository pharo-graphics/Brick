Class {
	#name : #BrStyleManager,
	#superclass : #Object,
	#instVars : [
		'styleMap'
	],
	#category : 'Brick-Style-Util'
}

{ #category : #'as yet unclassified' }
BrStyleManager >> initialize [
	super initialize.
	styleMap := Dictionary new.
]

{ #category : #'as yet unclassified' }
BrStyleManager >> stylesFor: aStyleable [
	styleMap at: aStyleable
]

{ #category : #'as yet unclassified' }
BrStyleManager >> transitionStatesFor: aNode [
	| parent states |
	states := OrderedCollection new.
	parent := aNode.
	[ parent isNotNil ]
		whileTrue:[ 
			states add: parent pseudoClassStates.
			parent := parent parent].
	^ states  
]
