Extension { #name : #BlockClosure }

{ #category : #'*Brick' }
BlockClosure >> asStencil [
	<return: #BrStencil>

	^ BrValuableStencil from: self
]

{ #category : #'*Brick' }
BlockClosure >> asStencil: aStencilClass [
	^ aStencilClass new executor: (BrStencilValuableExecutor from: self)
]
