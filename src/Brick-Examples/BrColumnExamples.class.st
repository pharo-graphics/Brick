Class {
	#name : #BrColumnExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-! Model - Column'
}

{ #category : #accessing }
BrColumnExamples >> default [
	<gtExample>
	| aColumn |
	aColumn := BrColumn new.
	self assert: aColumn title equals: 'Column'.
	self assert: aColumn width equals: BrColumnUndefinedWidth new.
	^ aColumn
]

{ #category : #accessing }
BrColumnExamples >> setFixed [
	<gtExample>
	| aColumn |
	
	aColumn := self default.
	aColumn width: 300.
	
	self
		assert: aColumn width
		equals: (BrColumnFixedWidth new width: 300).
	
	^ aColumn
]

{ #category : #accessing }
BrColumnExamples >> setTitle [
	<gtExample>
	| aColumn |

	aColumn := self default.
	aColumn title: 'Index'.

	self assert: aColumn title equals: 'Index'.

	^ aColumn
]

{ #category : #accessing }
BrColumnExamples >> setWeight [
	<gtExample>
	| aColumn |

	aColumn := self default.
	aColumn weight: 0.5.

	self assert: aColumn width equals: (BrColumnProportionalWidth new weight: 0.5).

	^ aColumn
]
