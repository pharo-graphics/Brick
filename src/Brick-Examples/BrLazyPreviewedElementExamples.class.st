Class {
	#name : #BrLazyPreviewedElementExamples,
	#superclass : #Object,
	#instVars : [
		'asyncExamples'
	],
	#category : #'Brick-Examples-Lazy Preview'
}

{ #category : #initialization }
BrLazyPreviewedElementExamples >> initialize [
	super initialize.
	asyncExamples := BlAsyncElementExamples new.
]

{ #category : #'examples - lazy element' }
BrLazyPreviewedElementExamples >> lazyPreviewedElement [
	<gtExample>
	^ asyncExamples lazyPreviewedElement
]

{ #category : #'examples - lazy element' }
BrLazyPreviewedElementExamples >> lazyPreviewedElementWithProgressStentil [
	<gtExample>
	| anElement |
	anElement := self lazyPreviewedElement.
	anElement layout: BlFrameLayout new.
	anElement previewStencil: self progressStencil.
	^ anElement
]

{ #category : #'examples - preview stencil' }
BrLazyPreviewedElementExamples >> progressStencil [
	<gtExample>
	^ BrLazyElementProgressPreviewStencil new.
	
]
