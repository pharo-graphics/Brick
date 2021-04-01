"
I am a text styler strategy used by ${class:BrTextEditor}$.
I style a text in a bacground process using ${method:BlockClosure>>#forkAt:named:}$.

See ${class:BrTextStylerStrategy}$ for futher explanation.

Example: ${example:BrTextStylerExamples>>#editorWithAsyncStylerStrategy|codeExpanded=false|previewExpanded=true}$


"
Class {
	#name : #BrTextStylerAsyncStrategy,
	#superclass : #BrTextStylerCommonAsyncStrategy,
	#instVars : [
		'backgroundProcess',
		'delay'
	],
	#category : #'Brick-Editor-Styler'
}

{ #category : #accessing }
BrTextStylerAsyncStrategy >> delay [
	<return: #Duration>
	^ delay
]

{ #category : #accessing }
BrTextStylerAsyncStrategy >> delay: aDuration [
	self 
		assert: [ aDuration isNotNil ] 
		description: [ 'Style text delay must be non-nil' ].
	delay := aDuration
]

{ #category : #private }
BrTextStylerAsyncStrategy >> doStyle: aBrEditorElement afterDo: aBlock [

	| aStyledText |
	self delay isZero ifFalse: [ self delay wait ].

	aBrEditorElement enqueueTask: (BlTaskAction new action: [
		aStyledText := self
		               doStyleText: aBrEditorElement editor text
		               with: aBrEditorElement editor styler
		               afterDo: aBlock.

		aBrEditorElement editor dispatchEvent: (BrTextStyledEvent new
			 text: aStyledText;
			 afterAction: aBlock;
			 editorElement: aBrEditorElement) ])
]

{ #category : #initialization }
BrTextStylerAsyncStrategy >> initialize [
	super initialize.
	delay := 200 milliSeconds.
]

{ #category : #styling }
BrTextStylerAsyncStrategy >> scheduleStyleTextInEditorElement: aBrEditorElement thenDo: aBlock [

	BlUseAsyncFeatures 
		ifEnabledDo: [  
			monitor critical: [ 
				self terminateBackgroundStylingProcess.
				backgroundProcess := [
					self doStyle: aBrEditorElement afterDo: aBlock 
				] forkAt: Processor userBackgroundPriority named: 'Text Styler Async Task' ] ]
		otherwise: [ self doStyle: aBrEditorElement afterDo: aBlock ]
]

{ #category : #private }
BrTextStylerAsyncStrategy >> terminateBackgroundStylingProcess [
	"Must be called in a monitor critical block."
	backgroundProcess ifNotNil: [ :aProcess |
		aProcess terminate.
		backgroundProcess := nil ]
]
