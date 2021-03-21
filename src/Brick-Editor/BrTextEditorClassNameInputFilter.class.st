Class {
	#name : #BrTextEditorClassNameInputFilter,
	#superclass : #BrTextEditorInputFilter,
	#category : #'Brick-Editor-Model'
}

{ #category : #accessing }
BrTextEditorClassNameInputFilter >> filter: aString [
	<return: #String>
	
	^ aString select: [ :eachCharacter | 
		eachCharacter isAlphaNumeric or: [ 
 		eachCharacter = $_ ] ]
]
