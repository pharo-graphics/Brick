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
BrTextStylerAsyncStrategy >> doStyle: aBlText afterDo: aBlock [
	self delay isZero ifFalse: [ self delay wait ].
	super doStyle: aBlText afterDo: aBlock
]

{ #category : #initialization }
BrTextStylerAsyncStrategy >> initialize [
	super initialize.
	backgroundProcess := nil.
	delay := 200 milliSeconds.
]

{ #category : #styling }
BrTextStylerAsyncStrategy >> style: aBlText afterDo: aBlock [
	self view ifNil: [ 
		"A graphical widget is not available, we therefore do not need to style the text"
		^ self ].
	BlUseAsyncFeatures 
		ifEnabledDo: [  
			monitor critical: [ 
				self terminateBackgroundStylingProcess.
				backgroundProcess := [
					self doStyle: aBlText afterDo: aBlock 
				] forkAt: Processor userBackgroundPriority named: 'Text Styler Async Task' ] ]
		otherwise: [ self doStyle: aBlText afterDo: aBlock ]
]

{ #category : #private }
BrTextStylerAsyncStrategy >> terminateBackgroundStylingProcess [
	"Must be called in a monitor critical block."
	backgroundProcess ifNotNil: [ :aProcess |
		aProcess terminate.
		backgroundProcess := nil ]
]
