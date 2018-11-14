Class {
	#name : #BrPagerScrollWish,
	#superclass : #BrWish,
	#instVars : [
		'isSmooth',
		'pageIndex'
	],
	#category : #'Brick-Pager - Events'
}

{ #category : #accessing }
BrPagerScrollWish >> isSmooth [
	^ isSmooth
]

{ #category : #accessing }
BrPagerScrollWish >> isSmooth: aBoolean [
	isSmooth := aBoolean
]

{ #category : #accessing }
BrPagerScrollWish >> pageIndex [
	^ pageIndex
]

{ #category : #accessing }
BrPagerScrollWish >> pageIndex: aNumber [
	pageIndex := aNumber
]
