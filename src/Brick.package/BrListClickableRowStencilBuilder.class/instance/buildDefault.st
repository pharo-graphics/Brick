api - instantiation
buildDefault
	| aList anIndex |

	aList := self listElement.
	anIndex := self rowIndex.

	^ BlElement new
		layout: BlLinearLayout horizontal alignCenterLeft;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		when: BlClickEvent do: [ :anEvent |
			anEvent consumed: true.
			aList selectOne: anIndex ]