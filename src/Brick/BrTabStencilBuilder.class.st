Class {
	#name : #BrTabStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'tabModel'
	],
	#category : #'Brick-Tabs - Model'
}

{ #category : #'api - instantiation' }
BrTabStencilBuilder >> buildDefault [
	<return: #BrStencil or: #BlElement>

	^ BlElement new
]

{ #category : #'api - instantiation' }
BrTabStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self tabModel
]

{ #category : #accessing }
BrTabStencilBuilder >> tabModel [
	<return: #BrTabModel>

	^ tabModel
]

{ #category : #accessing }
BrTabStencilBuilder >> tabModel: aBrTabModel [
	tabModel := aBrTabModel
]
