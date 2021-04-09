Extension { #name : #BrTreeNode }

{ #category : #'*Brick-Extensions' }
BrTreeNode >> gtNodesFor: aView [
	<gtView>
	
	^ aView columnedTree
		title: 'Nodes';
		priority: 1;
		items: [ { self } ];
		children: [ :anItem | anItem childrenNodes ];
		expandAll;
		column: 'Item' item: [ :anItem | anItem ];
		column: 'Index' item: [ :anItem | anItem indexInTree ] width: 80
]

{ #category : #'*Brick-Extensions' }
BrTreeNode >> gtRawNodesFor: aView [
	<gtView>
	
	^ aView columnedTree
		title: 'Raw Nodes';
		priority: 2;
		items: [ { self } ];
		children: [ :anItem | (anItem instVarNamed: #childrenNodes) ifNil: [ #() ] ];
		expandAll;
		column: 'Item' item: [ :anItem | anItem ];
		column: 'Index' item: [ :anItem | anItem indexInTree ] width: 80
]
