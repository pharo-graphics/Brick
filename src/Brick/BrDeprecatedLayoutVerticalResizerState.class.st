Class {
	#name : #BrDeprecatedLayoutVerticalResizerState,
	#superclass : #BrDeprecatedLayoutResizerState,
	#category : #'Brick-Layout Resizer - States'
}

{ #category : #testing }
BrDeprecatedLayoutVerticalResizerState class >> isDeprecated [
	^ true
]

{ #category : #accessing }
BrDeprecatedLayoutVerticalResizerState class >> resizer: aLayoutResizer [
	^ self new resizer: aLayoutResizer
]
