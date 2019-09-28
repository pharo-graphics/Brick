Class {
	#name : #BrPagerPageModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'embellisher'
	],
	#category : 'Brick-Pager - Model'
}

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
	
	embellisher := BrPagerPageEmbellisher new
]
