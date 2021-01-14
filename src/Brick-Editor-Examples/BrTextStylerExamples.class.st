"
Hello World *https://gtoolkit.com*
"
Class {
	#name : #BrTextStylerExamples,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples'
}

{ #category : #'examples - editor' }
BrTextStylerExamples >> codeSnippetStyler [
	<gtExample>
	^ BrRBTextStyler new classOrMetaClass: BlElement.
]

{ #category : #'examples - styler strategy' }
BrTextStylerExamples >> editorWithAsyncStylerStrategy [
	<gtExample>
	| anEditor aStyler theTextAttributes aSemaphore aTimeout anElement |
	anEditor := self editorWithMethod.
	aStyler := self codeSnippetStyler.
	anEditor useAsyncStylerStrategy.
	anEditor styler: aStyler.
	self assert: anEditor stylerStrategy class equals: BrTextStylerAsyncStrategy.
	self assert: anEditor stylerStrategy styler equals: aStyler.
	theTextAttributes := anEditor text attributesAt: 1.
	self assert: theTextAttributes size isZero.
	aSemaphore := Semaphore new.

	"Async styler strategy needs a view"
	anElement := BrEditorElement new editor: anEditor. 
	anEditor stylerStrategy delay: 0 seconds.
	self assert: anEditor stylerStrategy delay equals: 0 seconds.
	anEditor styleTextAndAfterDo: [ aSemaphore signal ].
	
	aTimeout := aSemaphore waitTimeoutMSecs: 100.
	"It timeouts anyway as the element is not in a Space yet."
	self assert: aTimeout.
	
	"We simulate the task execution that triggers styling"
	self assert: anElement taskQueue tasks size equals: 1.
	BlUseAsyncFeatures disableDuring: [ 
		anElement taskQueue tasks first run ].
	
	"We simulate the task execution of a new enqueued task that should update the editor text"
	self assert: anElement taskQueue tasks size equals: 2.
	anElement taskQueue tasks second run.
	
	aTimeout := aSemaphore waitTimeoutMSecs: 100.
	"It does not timeout as styling is processed in the same process as this test."
	self assert: aTimeout not.
	
	"And the text is finally styled"
	theTextAttributes := anEditor text attributesAt: 1.
	self assert: theTextAttributes size isZero not.
	^ anEditor
	
]

{ #category : #'examples - editor' }
BrTextStylerExamples >> editorWithMethod [
	<gtExample>
	^ self newEditor text: self newMethodText
]

{ #category : #'examples - styler strategy' }
BrTextStylerExamples >> editorWithSyncStylerStrategy [
	<gtExample>
	| anEditor aStyler theTextAttributes |
	anEditor := self editorWithMethod.
	aStyler := self codeSnippetStyler.
	anEditor useSyncStylerStrategy.
	anEditor styler: aStyler.
	self assert: anEditor stylerStrategy class equals: BrTextStylerSyncStrategy.
	self assert: anEditor stylerStrategy styler equals: aStyler.
	theTextAttributes := anEditor text attributesAt: 1.
	self assert: theTextAttributes size isZero not.
	^ anEditor
	
]

{ #category : #'examples - styler strategy' }
BrTextStylerExamples >> editorWithTaskItStylerStrategy [
	<gtExample>
	| anEditor aStyler theTextAttributes aSemaphore aTimeout anElement |
	anEditor := self editorWithMethod.
	aStyler := self codeSnippetStyler.
	anEditor useTaskItStylerStrategy.
	anEditor styler: aStyler.
	self assert: anEditor stylerStrategy class equals: BrTextStylerTaskItStrategy.
	self assert: anEditor stylerStrategy styler equals: aStyler.
	theTextAttributes := anEditor text attributesAt: 1.
	self assert: theTextAttributes size isZero.
	aSemaphore := Semaphore new.

	"Async styler strategy needs a view"
	anElement := BrEditorElement new editor: anEditor. 
	anEditor styleTextAndAfterDo: [ aSemaphore signal ].

	aTimeout := aSemaphore waitTimeoutMSecs: 100.
	"It timeouts anyway as the element is not in a Space yet."
	self assert: aTimeout.

	"We simulate the task execution that triggers styling"
	self assert: anElement taskQueue tasks size equals: 1.
	BlUseAsyncFeatures disableDuring: [ 
		anElement taskQueue tasks first run ].
	
	"We simulate the task execution of a new enqueued task that should update the editor text"
	self assert: anElement taskQueue tasks size equals: 2.
	anElement taskQueue tasks second run.
	
	aTimeout := aSemaphore waitTimeoutMSecs: 100.
	"It does not timeout as styling is processed in the same process as this test."
	self assert: aTimeout not.
	
	"And the text is finally styled"
	theTextAttributes := anEditor text attributesAt: 1.
	self assert: theTextAttributes size isZero not.
	^ anEditor
	
]

{ #category : #'instance creation' }
BrTextStylerExamples >> newEditor [
	<gtExample>

	^ BrTextEditor new
]

{ #category : #'instance creation' }
BrTextStylerExamples >> newMethodText [
	<gtExample>
	^ BlRopedText string: (BlElement>>#applyLayoutSafelyIn:context:) sourceCode
]

{ #category : #defaults }
BrTextStylerExamples >> timeoutMilliseconds [
	^ 500
]
