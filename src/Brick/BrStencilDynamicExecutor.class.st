Class {
	#name : #BrStencilDynamicExecutor,
	#superclass : #BrStencilExecutor,
	#instVars : [
		'valuable'
	],
	#category : 'Brick-! Core - Stencil'
}

{ #category : #running }
BrStencilDynamicExecutor >> execute: aCollectionOfArguments [
	self subclassResponsibility
]
