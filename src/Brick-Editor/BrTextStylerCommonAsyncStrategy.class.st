"
I am an abstract text styler strategy used by ${class:BrTextEditor}$.
My concrete subclass strategies should style text in a background process.
The common styling logic, that should be executed in the background process is implemented in ${method:BrTextStylerCommonAsyncStrategy>>#doStyle:afterDo:}$ and should be called from concete 
The subclasses should implement ${method:BrTextStylerStrategy>>#style:afterDo:}$ implementations.

See ${class:BrTextStylerStrategy}$ for futher explanation.

See my subclasses for concrete async strategies: ${class:BrTextStylerCommonAsyncStrategy|expanded=true|show=gtSubclassesFor:}$

"
Class {
	#name : #BrTextStylerCommonAsyncStrategy,
	#superclass : #BrTextStylerStrategy,
	#instVars : [
		'monitor',
		'isStylingRequested'
	],
	#category : #'Brick-Editor-Styler'
}

{ #category : #testing }
BrTextStylerCommonAsyncStrategy class >> isAbstract [
	^ self name = #BrTextStylerCommonAsyncStrategy 
]

{ #category : #'mutual exclusion' }
BrTextStylerCommonAsyncStrategy >> critical: aBlock [
	monitor critical: aBlock
]

{ #category : #initialization }
BrTextStylerCommonAsyncStrategy >> initialize [
	super initialize.

	monitor := Monitor new.
	isStylingRequested := false
]

{ #category : #accessing }
BrTextStylerCommonAsyncStrategy >> isStylingRequested [
	^ isStylingRequested
]

{ #category : #accessing }
BrTextStylerCommonAsyncStrategy >> isStylingRequested: aBoolean [
	isStylingRequested := aBoolean
]

{ #category : #private }
BrTextStylerCommonAsyncStrategy >> scheduleStyleTextInEditorElement: aBrEditorElement thenDo: aBlock [
	self subclassResponsibility
]

{ #category : #styling }
BrTextStylerCommonAsyncStrategy >> styleTextInEditorElement: aBrEditorElement thenDo: aBlock [
	BrStyleTextStartSignal new emit.
	
	monitor critical: [
		self isStylingRequested
			ifTrue: [
				BrStyleTextStylingAlreadyRequestedSignal new emit.
				^ self ].

		aBrEditorElement isAttachedToSceneGraph
			"if the editor is already attached to the scene graph we can style it directly"
			ifTrue: [
				BrStyleTextViewIsAttachedSignal new emit.
				self scheduleStyleTextInEditorElement: aBrEditorElement thenDo: aBlock ]
			ifFalse: [
				BrStyleTextViewIsNotAttachedSignal new emit.
				self isStylingRequested: true.
				"othrewise we should defer the styling until some time in the future when the element appears in the scene"
				aBrEditorElement enqueueTask: (BrTextStylerDeferringTask new
					stylerAsyncStrategy: self;
					textEditor: aBrEditorElement;
					afterBlock: aBlock) ] ]
]
