"
I only allow letters
"
Class {
	#name : #BrTextEditorLetterInputFilter,
	#superclass : #BrTextEditorInputFilter,
	#category : #'Brick-Editor-Model'
}

{ #category : #accessing }
BrTextEditorLetterInputFilter >> filter: aString [
	<return: #String>
	
	^ aString select: #isLetter
]
