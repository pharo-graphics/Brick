"
I exemplify ${class:BrGlamorousAsyncElementProgressPreviewStencil}$.

"
Class {
	#name : #BrGlamorousAsyncElementExamples,
	#superclass : #Object,
	#instVars : [
		'asyncExamples'
	],
	#category : #'Brick-Glamorous-Async Preview'
}

{ #category : #initialization }
BrGlamorousAsyncElementExamples >> initialize [
	super initialize.
	asyncExamples := BlAsyncElementExamples new.
]

{ #category : #'examples - lazy element' }
BrGlamorousAsyncElementExamples >> lazyPreviewedElement [
	<gtExample>
	^ asyncExamples lazyPreviewedElement
]

{ #category : #'examples - lazy element' }
BrGlamorousAsyncElementExamples >> lazyPreviewedElementWithProgressStentil [
	<gtExample>
	| anElement |
	anElement := self lazyPreviewedElement.
	anElement layout: BlFrameLayout new.
	anElement withDelayedPreview: self progressStencil.
	^ anElement
]

{ #category : #'examples - preview stencil' }
BrGlamorousAsyncElementExamples >> progressStencil [
	<gtExample>
	^ BrGlamorousAsyncElementProgressPreviewStencil new.
	
]
