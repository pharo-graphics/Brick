examples - look
columnedListWithLook
	<gtExample>
	| aColumnedListElement aColumnedListLook |
	
	aColumnedListElement := self columnedListElement.
	aColumnedListLook := self columnedListLook.
	
	aColumnedListElement look: aColumnedListLook.
	
	^ aColumnedListElement