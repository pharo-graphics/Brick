"
I allow letters and digits
"
Class {
	#name : #BrTextEditorAlphaNumericInputFilter,
	#superclass : #BrTextEditorInputFilter,
	#category : #'Brick-Editor-Model'
}

{ #category : #accessing }
BrTextEditorAlphaNumericInputFilter >> filter: aString [
	<return: #String>
	
	^ aString select: #isAlphaNumeric
]
