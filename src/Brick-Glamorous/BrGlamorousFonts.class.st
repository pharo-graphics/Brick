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
	#category : #'Brick-Glamorous'
}

{ #category : #'private - accessing' }
BrGlamorousFonts class >> fontsFolder [
	"Determine the fonts folder. Should work both for releaser and in development mode when the repository is present."
	| fontsFolderPath anIcebergFileReference aLocalFileReference |
	
	fontsFolderPath := (Path * 'feenkcom' / 'Brick' / 'data' / 'fonts').
	
	anIcebergFileReference := IceLibgitRepository repositoriesLocation resolvePath: fontsFolderPath.
	anIcebergFileReference exists ifTrue: [ ^ anIcebergFileReference ].
	
	aLocalFileReference := self localGtDirectory resolvePath: fontsFolderPath.
	aLocalFileReference exists ifTrue: [ ^ aLocalFileReference ].
	^ anIcebergFileReference
]

{ #category : #'private - accessing' }
BrGlamorousFonts class >> fontsSourceCodeProFolder [
	^ (self fontsFolder / 'Source_Code_Pro') asFileReference
]

{ #category : #'private - accessing' }
BrGlamorousFonts class >> fontsSourceSansProFolder [
	^ (self fontsFolder / 'Source_Sans_Pro') asFileReference 
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
		source: self sourceCodePro400Italic;
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
		source: self sourceSansPro400Italic;
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

{ #category : #'private - accessing' }
BrGlamorousFonts class >> load: aFontFile as: aName [
	"I compile a method that returns a ByteArray with a font."
	 aFontFile asFileReference binaryReadStreamDo: [ :aFileStream |
		self class compile: (String streamContents: [ :aStream |
			aStream
				nextPutAll: aName;
				cr;
				tab;
				nextPutAll: '^ ';
				print: aFileStream contents
		]) classified: 'fonts' ]
]

{ #category : #'private - accessing' }
BrGlamorousFonts class >> localGtDirectory [
	<return: #FileReference>
	^ Smalltalk imageDirectory / self localGtDirectoryName
]

{ #category : #'private - accessing' }
BrGlamorousFonts class >> localGtDirectoryName [
	^ 'gt-extra'
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro200ExtraLight [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-ExtraLight.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro200italicExtraLight [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-ExtraLightIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro300Light [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-Light.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro300italicLight [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-LightIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro400Italic [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-It.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro400Regular [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-Regular.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro500Medium [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-Medium.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro500italicMedium [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-MediumIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro600Semibold [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-Semibold.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro600italicSemibold [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-SemiboldIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro700Bold [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-Bold.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro700italicBold [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-BoldIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro900Black [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-Black.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceCodePro900italicBlack [
	^ (self fontsSourceCodeProFolder / 'SourceCodePro-BlackIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro200ExtraLight [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-ExtraLight.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro200italicExtraLight [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-ExtraLightIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro300Light [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-Light.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro300italicLight [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-LightIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro400Italic [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-It.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro400Regular [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-Regular.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro600Semibold [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-Semibold.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro600italicSemibold [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-SemiboldIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro700Bold [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-Bold.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro700italicBold [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-BoldIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro900Black [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-Black.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #fonts }
BrGlamorousFonts class >> sourceSansPro900italicBlack [
	^ (self fontsSourceSansProFolder / 'SourceSansPro-BlackIt.ttf') binaryReadStreamDo: [ :aFileStream | aFileStream contents ]
]

{ #category : #initialization }
BrGlamorousFonts class >> startUp: isImageStarting [
	"Pharo is starting up. If this platform requires specific intialization, this is a great place to put it."
	isImageStarting
		ifTrue: [ self initializeFonts ]
]
