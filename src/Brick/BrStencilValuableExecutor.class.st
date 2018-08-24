Class {
	#name : #BrStencilValuableExecutor,
	#superclass : #BrStencilExecutor,
	#instVars : [
		'valuable',
		'arguments'
	],
	#category : 'Brick-! Core - Stencil'
}

{ #category : #'instance creation' }
BrStencilValuableExecutor class >> from: aValuable [
	<return: #BrStencilValuableExecutor>

	^ self new valuable: aValuable
]

{ #category : #accessing }
BrStencilValuableExecutor >> arguments [
	<return: #Collection of: #Object>

	^ arguments
]

{ #category : #'api - running' }
BrStencilValuableExecutor >> execute [
	<return: #BlElement>

	^ self valuable glamourValueWithArgs: self arguments
]

{ #category : #initialization }
BrStencilValuableExecutor >> initialize [
	super initialize.
	
	arguments := LinkedList new
]

{ #category : #'api - arguments' }
BrStencilValuableExecutor >> push: anArgumentObject [
	arguments add: anArgumentObject
]

{ #category : #'api - arguments' }
BrStencilValuableExecutor >> resetArguments [
	arguments removeAll
]

{ #category : #accessing }
BrStencilValuableExecutor >> valuable [
	^ valuable
]

{ #category : #accessing }
BrStencilValuableExecutor >> valuable: anObject [
	valuable := anObject
]
