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
		'view',
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

{ #category : #private }
BrTextStylerCommonAsyncStrategy >> doStyle: aBrText afterDo: aBlock [
	| anElement aStyledBrText aTaskAction |
	anElement := self view.
	anElement ifNil: [ 
		"The graphical widget is no more available, we therefore do not need to style text".
		^ self ].
	aStyledBrText := self styler style: aBrText.
	aTaskAction := BlTaskAction new action: [ 
		self styler fireStyledEventForText: aStyledBrText andAfterAction: aBlock.
		 ].
	anElement enqueueTask: aTaskAction.
]

{ #category : #initialization }
BrTextStylerCommonAsyncStrategy >> initialize [
	super initialize.

	monitor := Monitor new.
	isStylingRequested := false.
	view := nil
]

{ #category : #accessing }
BrTextStylerCommonAsyncStrategy >> isStylingRequested [
	^ isStylingRequested
]

{ #category : #accessing }
BrTextStylerCommonAsyncStrategy >> isStylingRequested: aBoolean [
	isStylingRequested := aBoolean
]

{ #category : #styling }
BrTextStylerCommonAsyncStrategy >> styleTextInEditor: aBrTextEditor afterDo: aBlock [
	| aView aTextToStyle |
	
	BrTextStylerStyleTextInEditorStartSignal new emit.
	
	aView := self view.
	aView ifNil: [ 
		BrTextStylerStyleTextInEditorNoViewSignal new emit.
		"A graphical widget is not available, we therefore do not need to style the text"
		^ self ].
	
	aTextToStyle := aBrTextEditor textSnapshot nextGeneration.
	aTextToStyle
		ifEmpty: [
			BrTextStylerStyleTextInEditorTextIsEmptySignal new emit.
			^ self ].

	monitor critical: [
		isStylingRequested
			ifTrue: [
				BrTextStylerStyleTextInEditorStylingAlreadyRequestedSignal new emit.
				^ self ].

		aView isAttachedToSceneGraph
			"if the editor is already attached to the scene graph we can style it directly"
			ifTrue: [
				BrTextStylerStyleTextInEditorViewIsAttachedSignal new emit.
				self style: aTextToStyle afterDo: aBlock ]
			ifFalse: [
				BrTextStylerStyleTextInEditorViewIsNotAttachedSignal new emit.
				self isStylingRequested: true.
				"othrewise we should defer the styling until some time in the future when the element appears in the scene"
				aView enqueueTask: (BrTextStylerDeferringTask new
					stylerAsyncStrategy: self;
					textToStyle: aTextToStyle;
					textEditor: aBrTextEditor;
					afterBlock: aBlock) ] ]
]

{ #category : #accessing }
BrTextStylerCommonAsyncStrategy >> view [
	<return: #BlElement or: nil>
	^ view ifNotNil: [ :aWeakReference | aWeakReference at: 1 ]
]

{ #category : #accessing }
BrTextStylerCommonAsyncStrategy >> view: aBlElement [
	self 
		assert: [ aBlElement isNotNil ] 
		description: [ 'View must be non-nil' ].
	view := aBlElement asWeakReference
]
