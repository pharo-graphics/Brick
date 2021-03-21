Class {
	#name : #BrTextReplacingAttributeStrategy,
	#superclass : #Object,
	#category : #'Brick-Editor-Attributes - Support'
}

{ #category : #replacing }
BrTextReplacingAttributeStrategy >> swapString: aString [
	<return: #String>
	
	^ self subclassResponsibility
]
