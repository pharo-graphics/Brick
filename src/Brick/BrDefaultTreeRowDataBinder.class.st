"
I am used by default by both simple and columned trees to update the row element according to the node
"
Class {
	#name : #BrDefaultTreeRowDataBinder,
	#superclass : #BrTreeRowDataBinder,
	#category : #'Brick-Tree - Stencil'
}

{ #category : #'api - instantiation' }
BrDefaultTreeRowDataBinder >> buildDefault [
	<return: #BrStencil or: #BlElement>
	
	self rowElement
		childNamed: #toggle
		ifFound: [ :aToggleElement |
			aToggleElement viewModel model: self itemNode.
			aToggleElement
				hide: self itemNode isEmpty;
				expanded: self itemNode isExpanded;
				disabled: self itemNode isEmpty.
				
			aToggleElement margin: (BlInsets left: self itemNode depth * 15) ]
]
