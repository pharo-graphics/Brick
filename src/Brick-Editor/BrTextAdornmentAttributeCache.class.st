Class {
	#name : #BrTextAdornmentAttributeCache,
	#superclass : #Object,
	#category : #'Brick-Editor-Attributes - Support'
}

{ #category : #'api - cache' }
BrTextAdornmentAttributeCache >> ifAbsentPut: aBlock [
	"Return available cached elements previously created by an adornment attribute"
	<return: #SequenceableCollection of: #BlElement>

	^ self subclassResponsibility
]
