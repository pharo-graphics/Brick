"
!! Source Sans Pro 

Script used to load Source Sans Pro fonts in the image from their corresponding ttf files

[[[
BrGlamorousFonts load: './Source Sans Pro 200.ttf' as: 'sourceSansPro200ExtraLight'.
BrGlamorousFonts load: './Source Sans Pro 200italic.ttf' as: 'sourceSansPro200italicExtraLight'.
BrGlamorousFonts load: './Source Sans Pro 300.ttf' as: 'sourceSansPro300Light'.
BrGlamorousFonts load: './Source Sans Pro 300italic.ttf' as: 'sourceSansPro300italicLight'.
BrGlamorousFonts load: './Source Sans Pro 600.ttf' as: 'sourceSansPro600Semibold'.
BrGlamorousFonts load: './Source Sans Pro 600italic.ttf' as: 'sourceSansPro600italicSemibold'.
BrGlamorousFonts load: './Source Sans Pro 700.ttf' as: 'sourceSansPro700Bold'.
BrGlamorousFonts load: './Source Sans Pro 700italic.ttf' as: 'sourceSansPro700italicBold'.
BrGlamorousFonts load: './Source Sans Pro 900.ttf' as: 'sourceSansPro900Black'.
BrGlamorousFonts load: './Source Sans Pro 900italic.ttf' as: 'sourceSansPro900italicBlack'.
BrGlamorousFonts load: './Source Sans Pro regular.ttf' as: 'sourceSansPro400Regular'.
BrGlamorousFonts load: './Source Sans Pro italic.ttf' as: 'sourceSansPro400Italic'.
]]]

!! Source Code Pro

Script used to load Source Code Pro fonts in the image from their corresponding ttf files

[[[
BrGlamorousFonts load: './Source Code Pro 200.ttf' as: 'sourceCodePro200ExtraLight'.
BrGlamorousFonts load: './Source Code Pro 200italic.ttf' as: 'sourceCodePro200italicExtraLight'.
BrGlamorousFonts load: './Source Code Pro 300.ttf' as: 'sourceCodePro300Light'.
BrGlamorousFonts load: './Source Code Pro 300italic.ttf' as: 'sourceCodePro300italicLight'.
BrGlamorousFonts load: './Source Code Pro 500.ttf' as: 'sourceCodePro500Medium'.
BrGlamorousFonts load: './Source Code Pro 500italic.ttf' as: 'sourceCodePro500italicMedium'.
BrGlamorousFonts load: './Source Code Pro 600.ttf' as: 'sourceCodePro600Semibold'.
BrGlamorousFonts load: './Source Code Pro 600italic.ttf' as: 'sourceCodePro600italicSemibold'.
BrGlamorousFonts load: './Source Code Pro 700.ttf' as: 'sourceCodePro700Bold'.
BrGlamorousFonts load: './Source Code Pro 700italic.ttf' as: 'sourceCodePro700italicBold'.
BrGlamorousFonts load: './Source Code Pro 900.ttf' as: 'sourceCodePro900Black'.
BrGlamorousFonts load: './Source Code Pro 900italic.ttf' as: 'sourceCodePro900italicBlack'.
BrGlamorousFonts load: './Source Code Pro regular.ttf' as: 'sourceCodeProRegular'.
BrGlamorousFonts load: './Source Code Pro italic.ttf' as: 'sourceCodeProItalic'.
]]]
"
Class {
	#name : #BrGlamorousFonts,
	#superclass : #Object,
	#classInstVars : [
		'fontsCache'
	],
	#category : #'Brick-Glamorous'
}

{ #category : #'private - accessing' }
BrGlamorousFonts class >> fontNamed: aFontFileName fromFolderNamed: aFontFolderName [
	fontsCache ifNil: [ fontsCache := Dictionary new ].
	^ fontsCache 
		at: aFontFileName 
		ifAbsentPut: [ (self fontsFolder asFileReference / aFontFolderName / aFontFileName) binaryReadStreamDo: [ :aFileStream | 
				aFileStream contents ] ]
]

{ #category : #'private - accessing' }
BrGlamorousFonts class >> fontsFolder [
	"Determine the fonts folder. Should work both for releaser and in development mode when the repository is present."
	<return: #FileReference>
	^ GtResourcesUtility default resourceAtPath: Path * 'feenkcom' / 'Brick' / 'data' / 'fonts'
]

{ #category : #'private - accessing' }
BrGlamorousFonts class >> fontsSourceCodeProFolderName [
	^ 'Source_Code_Pro'
]

{ #category : #'private - accessing' }
BrGlamorousFonts class >> fontsSourceSansProFolderName [
	^ 'Source_Sans_Pro' 
]

{ #category : #initialization }
BrGlamorousFonts class >> initialize [
	self startUp: true.

	SessionManager default registerUserClassNamed: self name
]

{ #category : #initialization }
BrGlamorousFonts class >> initializeFonts [
	<script: 'self initializeFonts'>

	self initializeFontsOn: Bloc preferableSpartaCanvas offscreen.
]

{ #category : #initialization }
BrGlamorousFonts class >> initializeFontsOn: aCanvas [

	self initializeSourceCodeProOn: aCanvas.
	self initializeSourceSansProOn: aCanvas
]

{ #category : #initialization }
BrGlamorousFonts class >> initializeSourceCodeProOn: aCanvas [

	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleNormal;
		weightNormal;
		source: self sourceCodePro400Regular;
		build.
		
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleItalic;
		weightNormal;
		source: self sourceCodePro400italicRegular;
		build.

	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleNormal;
		weight: 200;
		source: self sourceCodePro200ExtraLight;
		build.
		
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleItalic;
		weight: 200;
		source: self sourceCodePro200italicExtraLight;
		build.

	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleNormal;
		weight: 300;
		source: self sourceCodePro300Light;
		build.
		
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleItalic;
		weight: 300;
		source: self sourceCodePro300italicLight;
		build.
		
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleNormal;
		weight: 500;
		source: self sourceCodePro500Medium;
		build.
		
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleItalic;
		weight: 500;
		source: self sourceCodePro500italicMedium;
		build.
		
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleNormal;
		weight: 600;
		source: self sourceCodePro600Semibold;
		build.
	
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleItalic;
		weight: 600;
		source: self sourceCodePro600italicSemibold;
		build.
		
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleNormal;
		weight: 700;
		source: self sourceCodePro700Bold;
		build.
		
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleItalic;
		weight: 700;
		source: self sourceCodePro700italicBold;
		build.
		
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleNormal;
		weight: 900;
		source: self sourceCodePro900Black;
		build.
		
	aCanvas fontFace
		familyName: 'Source Code Pro';
		stretchNormal;
		styleItalic;
		weight: 900;
		source: self sourceCodePro900italicBlack;
		build
]

{ #category : #initialization }
BrGlamorousFonts class >> initializeSourceSansProOn: aCanvas [

	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleNormal;
		weightNormal;
		source: self sourceSansPro400Regular;
		build.
		
	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleItalic;
		weightNormal;
		source: self sourceSansPro400italicRegular;
		build.

	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleNormal;
		weight: 200;
		source: self sourceSansPro200ExtraLight;
		build.
		
	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleItalic;
		weight: 200;
		source: self sourceSansPro200italicExtraLight;
		build.

	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleNormal;
		weight: 300;
		source: self sourceSansPro300Light;
		build.
		
	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleItalic;
		weight: 300;
		source: self sourceSansPro300italicLight;
		build.
		
	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleNormal;
		weight: 600;
		source: self sourceSansPro600Semibold;
		build.
		
	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleItalic;
		weight: 600;
		source: self sourceSansPro600italicSemibold;
		build.
		
	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleNormal;
		weight: 700;
		source: self sourceSansPro700Bold;
		build.
		
	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleItalic;
		weight: 700;
		source: self sourceSansPro700italicBold;
		build.
		
	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleNormal;
		weight: 900;
		source: self sourceSansPro900Black;
		build.
		
	aCanvas fontFace
		familyName: 'Source Sans Pro';
		stretchNormal;
		styleItalic;
		weight: 900;
		source: self sourceSansPro900italicBlack;
		build
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro200ExtraLight [
	^ self fontNamed: 'Source Code Pro 200.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro200italicExtraLight [
	^ self fontNamed: 'Source Code Pro 200italic.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro300Light [
	^ self fontNamed: 'Source Code Pro 300.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro300italicLight [
	^ self fontNamed: 'Source Code Pro 300italic.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro400Regular [
	^ self fontNamed: 'Source Code Pro regular.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro400italicRegular [
	^ self fontNamed: 'Source Code Pro italic.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro500Medium [
	^ self fontNamed: 'Source Code Pro 500.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro500italicMedium [
	^ self fontNamed: 'Source Code Pro 500italic.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro600Semibold [
	^ self fontNamed: 'Source Code Pro 600.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro600italicSemibold [
	^ self fontNamed: 'Source Code Pro 600italic.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro700Bold [
	^ self fontNamed: 'Source Code Pro 700.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro700italicBold [
	^ self fontNamed: 'Source Code Pro 700italic.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro900Black [
	^ self fontNamed: 'Source Code Pro 900.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source code pro' }
BrGlamorousFonts class >> sourceCodePro900italicBlack [
	^ self fontNamed: 'Source Code Pro 900italic.ttf' fromFolderNamed: self fontsSourceCodeProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro200ExtraLight [
	^ self fontNamed: 'Source Sans Pro 200.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro200italicExtraLight [
	^ self fontNamed: 'Source Sans Pro 200italic.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro300Light [
	^ self fontNamed: 'Source Sans Pro 300.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro300italicLight [
	^ self fontNamed: 'Source Sans Pro 300italic.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro400Regular [
	^ self fontNamed: 'Source Sans Pro regular.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro400italicRegular [
	^ self fontNamed: 'Source Sans Pro italic.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro600Semibold [
	^ self fontNamed: 'Source Sans Pro 600.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro600italicSemibold [
	^ self fontNamed: 'Source Sans Pro 600italic.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro700Bold [
	^ self fontNamed: 'Source Sans Pro 700.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro700italicBold [
	^ self fontNamed: 'Source Sans Pro 700italic.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro900Black [
	^ self fontNamed: 'Source Sans Pro 900.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #'fonts - source sans pro' }
BrGlamorousFonts class >> sourceSansPro900italicBlack [
	^ self fontNamed: 'Source Sans Pro 900italic.ttf' fromFolderNamed: self fontsSourceSansProFolderName
]

{ #category : #initialization }
BrGlamorousFonts class >> startUp: isImageStarting [
	"Pharo is starting up. If this platform requires specific intialization, this is a great place to put it."
	isImageStarting
		ifTrue: [ self initializeFonts ]
]
