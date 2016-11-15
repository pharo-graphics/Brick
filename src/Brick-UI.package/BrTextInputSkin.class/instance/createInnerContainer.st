initialization
createInnerContainer
	^ BlElement new
		layout: BlFrameLayout new;
		constraintsDo:[:c| c vhMatchParent];
		margin:(BlInsets top: 4 right: 4 bottom: 1 left: 4)