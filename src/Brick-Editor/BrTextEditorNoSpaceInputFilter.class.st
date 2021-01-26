"
I reject all characters that responds true to ${method:Character>>#isSeparator}$.
"
Class {
	#name : #BrTextEditorNoSpaceInputFilter,
	#superclass : #BrTextEditorInputFilter,
	#category : #'Brick-Editor-Model'
}

{ #category : #accessing }
BrTextEditorNoSpaceInputFilter >> filter: aString [
	<return: #String>
	
	^ aString reject: #isSeparator
]
