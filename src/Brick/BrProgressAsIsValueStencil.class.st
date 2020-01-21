Class {
	#name : #BrProgressAsIsValueStencil,
	#superclass : #BrProgressValueStencil,
	#category : #'Brick-Progress - Model'
}

{ #category : #'api - instantiation' }
BrProgressAsIsValueStencil >> create [
	<return: #String>
	^ self value
]
