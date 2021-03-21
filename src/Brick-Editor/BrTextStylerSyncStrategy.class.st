"
I am a text styler strategy used by ${class:BrTextEditor}$.
I style a text in the same active process, which should be a Bloc UI process to display the styled text properly to a user.

See ${class:BrTextStylerStrategy}$ for futher explanation.

Example: ${example:BrTextStylerExamples>>#editorWithSyncStylerStrategy|codeExpanded=false|previewExpanded=true}$


"
Class {
	#name : #BrTextStylerSyncStrategy,
	#superclass : #BrTextStylerStrategy,
	#category : #'Brick-Editor-Styler'
}

{ #category : #styling }
BrTextStylerSyncStrategy >> styleTextInEditorElement: aBrEditorElement thenDo: aBlock [
	| aStyledText |

	aStyledText := self
		doStyleText: aBrEditorElement editor text
		with: aBrEditorElement editor styler
		afterDo: aBlock.

	aBrEditorElement editor dispatchEvent: (BrTextStyledEvent new
		text: aStyledText;
		afterAction: aBlock;
		editorElement: aBrEditorElement)
]
