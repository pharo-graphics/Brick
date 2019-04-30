Extension { #name : #SequenceableCollection }

{ #category : #'*Brick' }
SequenceableCollection >> asBrLookChildAddAsChangeWithValue: anObject [
	^ BrLookChildAddAsChange new
		path: self;
		value: anObject;
		yourself
]

{ #category : #'*Brick' }
SequenceableCollection >> asBrLookChildAddChangeWithValue: anObject [
	^ BrLookChildAddChange new
		path: self;
		value: anObject;
		yourself
]

{ #category : #'*Brick' }
SequenceableCollection >> asBrLookCopyPropertyChangeWithValue: anObject [
	^ BrLookCopyPropertyChange new
		path: self;
		value: anObject;
		yourself
]

{ #category : #'*Brick' }
SequenceableCollection >> asBrLookPropertyChangeWithValue: anObject [
	^ BrLookPropertyChange new
		path: self;
		value: anObject;
		yourself
]
