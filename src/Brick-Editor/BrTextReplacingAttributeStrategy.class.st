Class {
	#name : #BrTextReplacingAttributeStrategy,
	#superclass : #Object,
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #replacing }
BrTextReplacingAttributeStrategy >> swapString: aString [
	<return: #String>
	
	^ self subclassResponsibility
]
