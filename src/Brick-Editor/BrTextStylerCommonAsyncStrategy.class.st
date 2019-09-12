Class {
	#name : #BrTextStylerCommonAsyncStrategy,
	#superclass : #BrTextStylerStrategy,
	#instVars : [
		'view',
		'monitor'
	],
	#category : #'Brick-Editor-Styler'
}

{ #category : #private }
BrTextStylerCommonAsyncStrategy >> doStyle: aBrText afterDo: aBlock [
	| anElement aStyledBrText aTaskAction |
	anElement := self view.
	anElement ifNil: [ 
		"The graphical widget is no more available, we therefore do not need to style text".
		^ self ].
	aStyledBrText := self styler onlyStyle: aBrText.
	aTaskAction := BlTaskAction new action: [ 
		self styler onlyFireStyledEventForText: aStyledBrText andAfterAction: aBlock.
		 ].
	anElement enqueueTask: aTaskAction.
]

{ #category : #initialization }
BrTextStylerCommonAsyncStrategy >> initialize [
	super initialize.
	monitor := Monitor new.
	view := nil.
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
