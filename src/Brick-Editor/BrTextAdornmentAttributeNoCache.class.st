Class {
	#name : #BrTextAdornmentAttributeNoCache,
	#superclass : #BrTextAdornmentAttributeCache,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Brick-Editor-Attributes - Support'
}

{ #category : #accessing }
BrTextAdornmentAttributeNoCache class >> cleanUp [
	uniqueInstance := nil
]

{ #category : #accessing }
BrTextAdornmentAttributeNoCache class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'api - cache' }
BrTextAdornmentAttributeNoCache >> ifAbsentPut: aBlock [
	"When cache is not enabled delegate back to the attribute"
	<return: #SequenceableCollection of: #BlElement>

	^ aBlock value
]
