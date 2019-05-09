Class {
	#name : #BrLookCopyPropertyChange,
	#superclass : #BrLookPropertyChange,
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrLookCopyPropertyChange >> initialize [
	super initialize.
	up := [ :e :f | 
	self
		writeOn: e
		value:
			(value isBlock
				ifTrue: [ value cull: f ]
				ifFalse: [ value ]) copy ].
	down := [ :e :f :g | self writeOn: e value: f copy ]
]

{ #category : #printing }
BrLookCopyPropertyChange >> printOn: aStream [
	aStream nextPutAll: 'copy '.
	super printOn: aStream
]
