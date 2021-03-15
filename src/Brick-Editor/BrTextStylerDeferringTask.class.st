"
I defer the styling request until the corresponding editor element is added to the scene graph
"
Class {
	#name : #BrTextStylerDeferringTask,
	#superclass : #BlTask,
	#instVars : [
		'stylerAsyncStrategy',
		'textEditor',
		'afterBlock'
	],
	#category : #'Brick-Editor-Styler'
}

{ #category : #accessing }
BrTextStylerDeferringTask >> afterBlock [
	^ afterBlock
]

{ #category : #accessing }
BrTextStylerDeferringTask >> afterBlock: anObject [
	afterBlock := anObject
]

{ #category : #'api - running' }
BrTextStylerDeferringTask >> run [
	self stylerAsyncStrategy
		isStylingRequested: false.
	self stylerAsyncStrategy
		styleTextInEditorElement: self textEditor
		thenDo: self afterBlock
]

{ #category : #accessing }
BrTextStylerDeferringTask >> stylerAsyncStrategy [
	^ stylerAsyncStrategy
]

{ #category : #accessing }
BrTextStylerDeferringTask >> stylerAsyncStrategy: anObject [
	stylerAsyncStrategy := anObject
]

{ #category : #accessing }
BrTextStylerDeferringTask >> textEditor [
	^ textEditor
]

{ #category : #accessing }
BrTextStylerDeferringTask >> textEditor: anObject [
	textEditor := anObject
]
