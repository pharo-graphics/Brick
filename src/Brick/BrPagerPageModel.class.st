Class {
	#name : #BrPagerPageModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'embellisher'
	],
	#category : #'Brick-Pager - Model'
}

{ #category : #defaults }
BrPagerPageModel >> defaultEmbellisher [
	^ BrPagerPageEmbellisher new
]

{ #category : #accessing }
BrPagerPageModel >> embellisher [
	^ embellisher
]

{ #category : #accessing }
BrPagerPageModel >> embellisher: aPagerPageEmbellisher [
	embellisher := aPagerPageEmbellisher
]

{ #category : #initialization }
BrPagerPageModel >> initialize [
	super initialize.
	embellisher := self defaultEmbellisher
]
