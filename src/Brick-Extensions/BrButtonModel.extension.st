Extension { #name : #BrButtonModel }

{ #category : #'*Brick-Extensions' }
BrButtonModel >> gtActionFor: aView [
	<gtView>
	
	self action isClosure
		ifFalse: [ ^ aView empty ].
		
	^ aView forward
		title: 'Action';
		priority: 1;
		object: [ self action ];
		view: #gtSourceCodeFor:;
		actionButtonIcon: BrGlamorousVectorIcons inspect 
			label: 'Action' 
			tooltip: 'Inspect action object' 
			action: [ :aButton | aButton phlow spawnObject: self action ]
]
