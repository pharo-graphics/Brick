Class {
	#name : #BrPager,
	#superclass : #BlElement,
	#category : 'Brick-Pager - UI'
}

{ #category : #'api - adding / removing' }
BrPager >> addPage: aContentElement [	
	self viewModel addPage: aContentElement viewModel
]

{ #category : #testing }
BrPager >> hasPageAfter: aPageElement [
	^ self viewModel hasPageAfter: aPageElement viewModel
]

{ #category : #initialization }
BrPager >> initialize [
	super initialize.
	
	self look: BrPagerScrollbarLook new + BrPagerLook new + BrLayoutLook linearVertical.
	self viewModel: BrPagerModel new
]

{ #category : #accessing }
BrPager >> pageAfter: aBlElement ifFound: aBlockClosure ifNone: aBlockClosure3 [ 
	self viewModel 
		pageAfter: aBlElement viewModel 
		ifFound: aBlockClosure 
		ifNone: aBlockClosure3 
]

{ #category : #'api - accessing' }
BrPager >> pages [
	^ self viewModel pages
]

{ #category : #'api - adding / removing' }
BrPager >> removePage: aContentElement [	
	self viewModel removePage: aContentElement viewModel
]

{ #category : #'api - adding / removing' }
BrPager >> removePagesAfter: aPageElement [	
	self viewModel removePagesAfter: aPageElement viewModel
]
