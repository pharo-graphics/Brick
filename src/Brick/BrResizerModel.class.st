Class {
	#name : #BrResizerModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'target'
	],
	#category : #'Brick-Resizer - Model'
}

{ #category : #initialization }
BrResizerModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrResizerTargetRequest reply: [ :anEvent | anEvent targetElement: self target ]
]

{ #category : #notifying }
BrResizerModel >> notifyTargetChanged: aTargetElement [
	self dispatchEvent: (BrResizerTargetChanged new targetElement: aTargetElement)
]

{ #category : #accessing }
BrResizerModel >> target [
	<return: #BlElement>

	^ target
]

{ #category : #accessing }
BrResizerModel >> target: aBlElement [
	target := aBlElement.
	self notifyTargetChanged: aBlElement
]
