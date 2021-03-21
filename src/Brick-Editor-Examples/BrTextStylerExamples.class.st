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

	^ BrRBTextStyler new classOrMetaClass: BlElement
]

{ #category : #'examples - styler strategy' }
BrTextStylerExamples >> editorWithAsyncStylerStrategy [
	<gtExample>
	<noTest>
	| anEditor aStyler theTextAttributes aSemaphore aTimeout anElement aSpace |
	anEditor := self editorWithMethod.
	aStyler := self codeSnippetStyler.
	anEditor useAsyncStylerStrategy.
	anEditor styler: aStyler.
	self assert: anEditor stylerStrategy class equals: BrTextStylerAsyncStrategy.
	theTextAttributes := anEditor text attributesAt: 1.
	self assert: theTextAttributes size isZero.
	aSemaphore := Semaphore new.

	"Async styler strategy needs a view"
	anElement := BrEditorElement new editor: anEditor. 
	anEditor stylerStrategy delay: 0 seconds.
	self assert: anEditor stylerStrategy delay equals: 0 seconds.
	anEditor styleTextAndAfterDo: [ :aStyledText | aSemaphore signal ].
	
	aTimeout := aSemaphore waitTimeoutMSecs: 100.
	"It timeouts anyway as the element is not in a Space yet."
	self assert: aTimeout.
	
	"still one task pending, because the element was not in the space"
	self assert: anElement taskQueue tasks size equals: 1.
	
	aSpace := BlSpace new.
	aSpace host: BlMockedHost new.
	aSpace addChild: anElement.
	
	"We simulate the task execution that triggers styling"
	BlUseAsyncFeatures disableDuring: [ aSpace pulse ].
	
	"We simulate the task execution of a new enqueued task that should update the editor text"
	self assert: anElement taskQueue tasks size equals: 0.
	
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
	| anEditor anEditorElement aStyler theTextAttributes |

	anEditor := self editorWithMethod.	
	aStyler := self codeSnippetStyler.
	
	anEditorElement := BrEditorElement new.
	anEditorElement editor: anEditor.

	anEditor useSyncStylerStrategy.
	anEditor styler: aStyler.
	self assert: anEditor stylerStrategy class equals: BrTextStylerSyncStrategy.
	theTextAttributes := anEditor text attributesAt: 1.
	self assert: theTextAttributes size isZero not.

	^ anEditor
	
]

{ #category : #'examples - styler strategy' }
BrTextStylerExamples >> editorWithTaskItStylerStrategy [
	<gtExample>
	| anEditor aStyler theTextAttributes aSemaphore aTimeout anElement aSpace |
	anEditor := self editorWithMethod.
	aStyler := self codeSnippetStyler.
	anEditor useTaskItStylerStrategy.
	anEditor styler: aStyler.
	self assert: anEditor stylerStrategy class equals: BrTextStylerTaskItStrategy.
	theTextAttributes := anEditor text attributesAt: 1.
	self assert: theTextAttributes size isZero.
	aSemaphore := Semaphore new.

	"Async styler strategy needs a view"
	anElement := BrEditorElement new editor: anEditor. 
	anEditor styleTextAndAfterDo: [ :aStyledText | aSemaphore signal ].

	aTimeout := aSemaphore waitTimeoutMSecs: 100.
	"It timeouts anyway as the element is not in a Space yet."
	self assert: aTimeout.

	"since an element was not attached to the space it has one task pending"
	self assert: anElement taskQueue tasks size equals: 1.
	
	aSpace := BlSpace new.
	aSpace host: BlMockedHost new.
	aSpace addChild: anElement.
	"We simulate the task execution that triggers styling"
	BlUseAsyncFeatures disableDuring: [ aSpace pulse ].
	
	"no more tasks"
	self assert: anElement taskQueue tasks size equals: 0.
	
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
