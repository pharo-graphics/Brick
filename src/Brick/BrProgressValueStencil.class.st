Class {
	#name : #BrProgressValueStencil,
	#superclass : #BrStencil,
	#instVars : [
		'value'
	],
	#category : #'Brick-Progress - Model'
}

{ #category : #'api - instantiation' }
BrProgressValueStencil >> create [
	<return: #String>
	^ self subclassResponsibility
]

{ #category : #initialization }
BrProgressValueStencil >> initialize [
	super initialize.
	value := 0.
]

{ #category : #accessing }
BrProgressValueStencil >> value [
	^ value
]

{ #category : #accessing }
BrProgressValueStencil >> value: anObject [
	value := anObject
]
