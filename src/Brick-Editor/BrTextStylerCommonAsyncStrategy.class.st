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
		'monitor'
	],
	#category : #'Brick-Editor-Styler'
}

{ #category : #testing }
BrTextStylerCommonAsyncStrategy class >> isAbstract [
	^ self name = #BrTextStylerCommonAsyncStrategy 
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
	view := nil.
]

{ #category : #styling }
BrTextStylerCommonAsyncStrategy >> styleTextInEditor: aBrTextEditor afterDo: aBlock [
	| aView |
	aView := self view.
	aView ifNil: [ 
		"A graphical widget is not available, we therefore do not need to style the text"
		^ self ].
	aView enqueueTask: (BlTaskAction new action: [
		aBrTextEditor text isEmpty ifFalse: [
			self style: aBrTextEditor text nextGeneration afterDo: aBlock ] ])
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
