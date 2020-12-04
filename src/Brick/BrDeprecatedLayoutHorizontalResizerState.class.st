Class {
	#name : #BrDeprecatedLayoutHorizontalResizerState,
	#superclass : #BrDeprecatedLayoutResizerState,
	#category : #'Brick-Layout Resizer - States'
}

{ #category : #testing }
BrDeprecatedLayoutHorizontalResizerState class >> isDeprecated [
	^ true
]

{ #category : #'instance creation' }
BrDeprecatedLayoutHorizontalResizerState class >> resizer: aLayoutResizer [
	^ self new resizer: aLayoutResizer
]
