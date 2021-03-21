Extension { #name : #BlockClosure }

{ #category : #'*Brick' }
BlockClosure >> asBrAnchoredAnchorBounds [
	^ BrAnchoredDelegateAnchorBounds block: self
]

{ #category : #'*Brick' }
BlockClosure >> asBrAnchoredReferencePoint [
	^ BrAnchoredDelegateReferencePoint block: self
]

{ #category : #'*Brick' }
BlockClosure >> asStencil [
	<return: #BrStencil>

	^ BrValuableStencil from: self
]

{ #category : #'*Brick' }
BlockClosure >> asStencil: aStencilClass [
	^ aStencilClass new executor: (BrStencilValuableExecutor from: self)
]
