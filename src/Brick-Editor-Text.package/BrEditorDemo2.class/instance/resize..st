as yet unclassified
resize: anImageFile
	
  | parentFolder originalImage resizedImage |

  parentFolder := anImageFile parent.
  originalImage := Form fromFileNamed: anImageFile.

  resizedImage := originalImage scaledToSize: 200@200.
  resizedImage writePNGFileNamed:
		anImageFile base, '_200x200.png'.

  ^ resizedImage