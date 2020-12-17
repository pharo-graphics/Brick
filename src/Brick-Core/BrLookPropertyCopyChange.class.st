Class {
	#name : #BrLookPropertyCopyChange,
	#superclass : #BrLookPropertyChange,
	#category : #'Brick-Core-Changes'
}

{ #category : #initialization }
BrLookPropertyCopyChange >> initialize [
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
BrLookPropertyCopyChange >> printOn: aStream [
	aStream nextPutAll: 'copy '.
	super printOn: aStream
]
