Class {
	#name : #BrLabel,
	#superclass : #BlElement,
	#category : #'Brick-Label - UI'
}

{ #category : #initialization }
BrLabel >> initialize [
	super initialize.

	self viewModel: (BrLabelModel new)
]

{ #category : #accessing }
BrLabel >> text [
	<return: #BlText>

	^ self viewModel text
]

{ #category : #accessing }
BrLabel >> text: aTextOrString [
	self viewModel text: aTextOrString
]
