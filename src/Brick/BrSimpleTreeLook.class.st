Class {
	#name : #BrSimpleTreeLook,
	#superclass : #BrTreeLook,
	#category : #'Brick-Tree - Look'
}

{ #category : #initialization }
BrSimpleTreeLook >> initialize [
	super initialize.

	treeElement dataSource: BrSimpleTreeDataSource new.
	self rowStencilBuilder: BrSimpleTreeRowStencilBuilder new
]
