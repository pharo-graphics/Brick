Class {
	#name : #BrProgressIntegerValueStencil,
	#superclass : #BrProgressValueStencil,
	#category : #'Brick-Progress - Model'
}

{ #category : #'api - instantiation' }
BrProgressIntegerValueStencil >> create [
	<return: #String>
	^ self value asInteger
]
