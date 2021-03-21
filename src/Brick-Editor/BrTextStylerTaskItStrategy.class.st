"
I am a text styler strategy used by ${class:BrTextEditor}$.
I style a text in a TaskIt background process using ${class:BlTktWorkerProvider}$.

See ${class:BrTextStylerStrategy}$ for futher explanation.

Example: ${example:BrTextStylerExamples>>#editorWithTaskItStylerStrategy|codeExpanded=false|previewExpanded=true}$


"
Class {
	#name : #BrTextStylerTaskItStrategy,
	#superclass : #BrTextStylerCommonAsyncStrategy,
	#instVars : [
		'command'
	],
	#category : #'Brick-Editor-Styler'
}

{ #category : #private }
BrTextStylerTaskItStrategy >> commandNameFromText: aBrText [
	^ aBrText isEmpty
		ifTrue: [ '<empty query>' ]
		ifFalse: [ (aBrText from: 1 to: (aBrText size min: 20)) printString ]
]

{ #category : #'instance creation' }
BrTextStylerTaskItStrategy >> newStylingCommandFor: aBlText with: aStyler inEditorElement: aBrEditorElement afterDo: aBlock [
	<return: #BlTktTerminableCommand>
	| aName aCommand |
	aName := self commandNameFromText: aBlText.
	aCommand := [
		| aStyledText |
		aStyledText := self doStyleText: aBlText with: aStyler afterDo: aBlock.
		aBrEditorElement enqueueTask: (BlTaskAction new action: [
			aBrEditorElement editor dispatchEvent: (BrTextStyledEvent new
				text: aStyledText;
				afterAction: aBlock;
				editorElement: aBrEditorElement) ]).
		command := nil ] asBlTktTerminableCommand asBlTktLoggingCommand.
	aCommand name: 'Text Styler for ''' , aName , ''''.
	^ aCommand
]

{ #category : #private }
BrTextStylerTaskItStrategy >> scheduleStyleTextInEditorElement: aBrEditorElement thenDo: aBlock [
	| aTextToStyle aStyler |
	
	aStyler := aBrEditorElement editor styler.
	aTextToStyle := aBrEditorElement editor text.

	BlUseAsyncFeatures 
		ifEnabledDo: [ 
			monitor critical: [ 
				self terminateBackgroundStylingProcess.

				BlTktWorkerProvider nonUIMultiPool
					schedule: (command := self
						newStylingCommandFor: aTextToStyle
						with: aStyler
						inEditorElement: aBrEditorElement
						afterDo: aBlock) ] ]
		otherwise: [
			| aStyledText |
			aStyledText := self doStyleText: aTextToStyle with: aStyler afterDo: aBlock.
			aBrEditorElement editor dispatchEvent: (BrTextStyledEvent new
				text: aStyledText;
				afterAction: aBlock;
				editorElement: aBrEditorElement) ]
]

{ #category : #private }
BrTextStylerTaskItStrategy >> terminateBackgroundStylingProcess [
	"Must be called within monitor critical code"
	command ifNotNil: [ :aCommand |
		aCommand terminate.
		command := nil ]
]
