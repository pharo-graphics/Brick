"
! Maximizer host look
Is used together with ${class:BrWithMaximizerLook}$ in order to mark a target element as a possible host for maximization.
At any given time there can be multiple potential hosts. Users should be able to choose in which one of them a maximized element should be hosted.

A maximizer host is responsible for embedding and embellishming the maximized element. This allows users to create different types of maximizer hosts that look and behave differently
"
Class {
	#name : #BrMaximizerHostLook,
	#superclass : #BrLook,
	#category : #'Brick-Maximizer - Look'
}

{ #category : #initialization }
BrMaximizerHostLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrMaximizerMaximizeWish do: [ :anEvent | self onMaximize: anEvent ]
]

{ #category : #hooks }
BrMaximizerHostLook >> onMaximize: aMaximizeWish [
	"Subclasses should handle ${class:BrMaximizerMaximizeWish}$ and correctly place the #elementToMaximize
	within the widget element. Maximizer hosts is responsible to saving and restoring the properties of the
	element to maximize when it is minimized."

	self subclassResponsibility
]
