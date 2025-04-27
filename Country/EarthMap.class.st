"
This is a class that **imports the country list** and acts as a mini database for the future functionalities.
"
Class {
	#name : 'EarthMap',
	#superclass : 'Object',
	#instVars : [
		'countries'
	],
	#category : 'Country',
	#package : 'Country'
}

{ #category : 'converting' }
EarthMap >> importCountryFromXMLNode: aXMLElement [
	countries add: (EarthMapCountry new fromXML: aXMLElement )
]

{ #category : 'initialization' }
EarthMap >> initialize [ 
	
	super initialize.
	countries := OrderedCollection new
]

{ #category : 'canvas' }
EarthMap >> openPopulatedCanvas [
	
	self populatedCanvas open
]

{ #category : 'canvas' }
EarthMap >> populatedCanvas [
	^ RSCanvas new 
		addAll: (countries collect: [ :country | country asRSShape ]);
		@ RSCanvasController;
		yourself 

]

{ #category : 'accessing' }
EarthMap >> xmlTreeFromFile: aFileName [
	^ aFileName asFileReference readStreamDo: [ :stream | (XMLDOMParser parse: stream) document ]
]
