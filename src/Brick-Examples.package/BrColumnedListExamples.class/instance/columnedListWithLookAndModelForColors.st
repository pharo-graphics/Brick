examples - look
columnedListWithLookAndModelForColors
	<gtExample>
	| aColumnedListElement aColumnedListModel |

	aColumnedListElement := self columnedListWithLook.
	aColumnedListModel := self columnedListModelWithColorAsItems.
	
	aColumnedListElement viewModel: aColumnedListModel.
	
	^ aColumnedListElement