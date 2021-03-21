Class {
	#name : #BrWithContextMenuModel,
	#superclass : #BrWithAnchoredModel,
	#category : #'Brick-Context Menu - Model'
}

{ #category : #notifying }
BrWithContextMenuModel >> stencilChangedEvent [
	^ BrContextMenuStencilChanged new
]

{ #category : #notifying }
BrWithContextMenuModel >> stencilRequestClass [
	^ BrContextMenuStencilRequest
]

{ #category : #notifying }
BrWithContextMenuModel >> visibleChangedEvent [
	^ BrContextMenuVisibleChanged new
]

{ #category : #notifying }
BrWithContextMenuModel >> visibleRequestClass [
	^ BrContextMenuVisibleRequest
]
