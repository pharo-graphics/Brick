Class {
	#name : #BrLookPropertyChange,
	#superclass : #BrLookChange,
	#instVars : [
		'path',
		'value'
	],
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrLookPropertyChange >> initialize [
	super initialize.
	read := [ :e | self readOn: e ].
	up := [ :e :f | self writeOn: e value: value ].
	down := [ :e :f :g | self writeOn: e value: g ]
]

{ #category : #accessing }
BrLookPropertyChange >> path [
	^ path
]

{ #category : #accessing }
BrLookPropertyChange >> path: anObject [
	path := anObject
]

{ #category : #initialization }
BrLookPropertyChange >> readOn: aLook [
	^ path copy inject: aLook into: [ :e :f | e perform: f ]
]

{ #category : #accessing }
BrLookPropertyChange >> value [
	^ value
]

{ #category : #accessing }
BrLookPropertyChange >> value: anObject [
	value := anObject
]

{ #category : #initialization }
BrLookPropertyChange >> writeOn: aLook value: anObject [
	| receiver |
	receiver := (path copyFrom: 1 to: path size - 1)
		inject: aLook
		into: [ :e :f | e perform: f ].
	^ receiver perform: path last , ':' with: anObject
]
