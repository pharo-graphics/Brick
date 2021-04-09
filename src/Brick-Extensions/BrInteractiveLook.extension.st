Extension { #name : #BrInteractiveLook }

{ #category : #'*Brick-Extensions' }
BrInteractiveLook >> gtStylesFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Styles';
		priority: 3;
		items: [ self styles ];
		column: 'State' item: [ :eachItem | eachItem state ] width: 200;
		column: 'Action' item: [ :eachItem | eachItem action ]
		
]
