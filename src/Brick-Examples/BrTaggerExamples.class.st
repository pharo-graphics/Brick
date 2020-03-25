Class {
	#name : #BrTaggerExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tagger'
}

{ #category : #'instance creation' }
BrTaggerExamples >> newGlamorousTagger [
	<gtExample>

	^ BrTagger new
		look: BrGlamorousTaggerEditableLook new;
		namedTags: { 'How' . 'Are' . 'You' };
		when: BrTaggerAddTagRequest do: [ :aRequest |
			aRequest tag name
				ifNotEmpty: [ aRequest currentTarget addTag: aRequest tag ] ];
		when: BrTaggerRemoveTagRequest do: [ :aRequest | aRequest currentTarget removeTag: aRequest tag ];
		when: BrTaggerRenameTagRequest do: [ :aRequest |
			aRequest newName trimmed
				ifEmpty: [ aRequest currentTarget removeTag: aRequest tag ]
				ifNotEmpty: [ :aNewName | aRequest currentTarget renameTag: aRequest tag to: aNewName ] ]
]
