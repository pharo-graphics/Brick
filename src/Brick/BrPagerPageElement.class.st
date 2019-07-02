"
I am the wrapper around the contents of one page, resizer and next button.
"
Class {
	#name : #BrPagerPageElement,
	#superclass : #BlElement,
	#category : #'Brick-Pager - Support'
}

{ #category : #initialization }
BrPagerPageElement >> initialize [
	super initialize.
	
	self viewModel: BrPagerPageModel new
]
