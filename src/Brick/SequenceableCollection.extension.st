Extension { #name : #SequenceableCollection }

{ #category : #'*Brick' }
SequenceableCollection >> asBrLookPropertyChangeWithValue: anObject [
	^ BrLookPropertyChange new
		path: self;
		value: anObject;
		yourself
]
