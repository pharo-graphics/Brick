Class {
	#name : #BrLookCopyPropertyChange,
	#superclass : #BrLookPropertyChange,
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrLookCopyPropertyChange >> initialize [
	super initialize.
	up := [ :e :f | self writeOn: e value: value value copy ].
	down := [ :e :f :g | self writeOn: e value: f copy ]
]
