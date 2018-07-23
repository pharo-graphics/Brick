examples - list
listAllClasses
	<gtExample>
	| aListElement aListLook aListModel |

	aListElement := self listElement.

	aListModel := self listModel.
	aListModel items: Smalltalk allClasses.

	aListLook := self listLook.	
	aListElement look: aListLook.
	aListElement viewModel: aListModel.

	^ aListElement