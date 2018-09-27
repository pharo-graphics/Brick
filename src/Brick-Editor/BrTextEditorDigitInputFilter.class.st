"
I only allow digits
"
Class {
	#name : #BrTextEditorDigitInputFilter,
	#superclass : #BrTextEditorInputFilter,
	#category : #'Brick-Editor-Model'
}

{ #category : #accessing }
BrTextEditorDigitInputFilter >> filter: aString [
	<return: #String>
	
	^ aString select: #isDigit
]
