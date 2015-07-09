//
// TEDGlue.m
// TextEdit.app 1.10
// AppleEventBridge.framework 0.7.0
// aebglue -o -r TextEdit
//

#import "TEDGlue.h"

// TO DO: add comments where -release calls are needed in non-ARC builds


@implementation TEDFormatter
- (NSString *)propertyByCode:(OSType)code {
    switch (code) {
        case 0x70626e64: return @"bounds";
        case 0x70636c73: return @"class_";
        case 0x68636c62: return @"closeable";
        case 0x6c77636c: return @"collating";
        case 0x636f6c72: return @"color";
        case 0x6c776370: return @"copies";
        case 0x646f6375: return @"document";
        case 0x6c776c70: return @"endingPage";
        case 0x6c776568: return @"errorHandling";
        case 0x6661786e: return @"faxNumber";
        case 0x6174666e: return @"fileName";
        case 0x6973666c: return @"floating";
        case 0x666f6e74: return @"font";
        case 0x70697366: return @"frontmost";
        case 0x49442020: return @"id_";
        case 0x70696478: return @"index";
        case 0x69736d6e: return @"miniaturizable";
        case 0x706d6e64: return @"miniaturized";
        case 0x706d6f64: return @"modal";
        case 0x696d6f64: return @"modified";
        case 0x706e616d: return @"name";
        case 0x6c776c61: return @"pagesAcross";
        case 0x6c776c64: return @"pagesDown";
        case 0x70707468: return @"path";
        case 0x70414c4c: return @"properties";
        case 0x6c777174: return @"requestedPrintTime";
        case 0x7072737a: return @"resizable";
        case 0x7074737a: return @"size";
        case 0x6c776670: return @"startingPage";
        case 0x74727072: return @"targetPrinter";
        case 0x63747874: return @"text";
        case 0x70746974: return @"titled";
        case 0x76657273: return @"version_";
        case 0x70766973: return @"visible";
        case 0x69737a6d: return @"zoomable";
        case 0x707a756d: return @"zoomed";
        default: return [super propertyByCode: code];
    }
}
- (NSString *)elementsByCode:(OSType)code {
    switch (code) {
        case 0x63617070: return @"applications";
        case 0x61747473: return @"attachment";
        case 0x63617472: return @"attributeRuns";
        case 0x63686120: return @"characters";
        case 0x636f6c72: return @"colors";
        case 0x646f6375: return @"documents";
        case 0x636f626a: return @"items";
        case 0x63706172: return @"paragraphs";
        case 0x70736574: return @"printSettings";
        case 0x63747874: return @"text";
        case 0x6377696e: return @"windows";
        case 0x63776f72: return @"words";
        default: return [super elementsByCode: code];
    }
}
- (NSString *)prefix {
    return @"TED";
}
@end




@implementation TEDSymbol
+ (AEBSymbol *)aebSymbolForCode:(OSType)code_ {
    switch (code_) {
        case 0x61707220: return self.April;
        case 0x61756720: return self.August;
        case 0x63737472: return self.CString;
        case 0x64656320: return self.December;
        case 0x45505320: return self.EPSPicture;
        case 0x66656220: return self.February;
        case 0x66726920: return self.Friday;
        case 0x47494666: return self.GIFPicture;
        case 0x4a504547: return self.JPEGPicture;
        case 0x6a616e20: return self.January;
        case 0x6a756c20: return self.July;
        case 0x6a756e20: return self.June;
        case 0x6d617220: return self.March;
        case 0x6d617920: return self.May;
        case 0x6d6f6e20: return self.Monday;
        case 0x6e6f7620: return self.November;
        case 0x6f637420: return self.October;
        case 0x50494354: return self.PICTPicture;
        case 0x70737472: return self.PascalString;
        case 0x74723136: return self.RGB16Color;
        case 0x74723936: return self.RGB96Color;
        case 0x63524742: return self.RGBColor;
        case 0x73617420: return self.Saturday;
        case 0x73657020: return self.September;
        case 0x73756e20: return self.Sunday;
        case 0x54494646: return self.TIFFPicture;
        case 0x74687520: return self.Thursday;
        case 0x74756520: return self.Tuesday;
        case 0x75743136: return self.UTF16Text;
        case 0x75746638: return self.UTF8Text;
        case 0x75747874: return self.UnicodeText;
        case 0x77656420: return self.Wednesday;
        case 0x616c6973: return self.alias;
        case 0x2a2a2a2a: return self.anything;
        case 0x63617070: return self.application;
        case 0x62756e64: return self.applicationBundleID;
        case 0x726d7465: return self.applicationResponses;
        case 0x7369676e: return self.applicationSignature;
        case 0x6170726c: return self.applicationURL;
        case 0x61736b20: return self.ask;
        case 0x61747473: return self.attachment;
        case 0x63617472: return self.attributeRun;
        case 0x62657374: return self.best;
        case 0x626f6f6c: return self.boolean;
        case 0x71647274: return self.boundingRectangle;
        case 0x70626e64: return self.bounds;
        case 0x63617365: return self.case_;
        case 0x636d7472: return self.centimeters;
        case 0x63686120: return self.character;
        case 0x67636c69: return self.classInfo;
        case 0x70636c73: return self.class_;
        case 0x68636c62: return self.closeable;
        case 0x6c77636c: return self.collating;
        case 0x636f6c72: return self.color;
        case 0x636c7274: return self.colorTable;
        case 0x6c776370: return self.copies;
        case 0x63636d74: return self.cubicCentimeters;
        case 0x63666574: return self.cubicFeet;
        case 0x6375696e: return self.cubicInches;
        case 0x636d6574: return self.cubicMeters;
        case 0x63797264: return self.cubicYards;
        case 0x74646173: return self.dashStyle;
        case 0x72646174: return self.data;
        case 0x6c647420: return self.date;
        case 0x6465636d: return self.decimalStruct;
        case 0x64656763: return self.degreesCelsius;
        case 0x64656766: return self.degreesFahrenheit;
        case 0x6465676b: return self.degreesKelvin;
        case 0x6c776474: return self.detailed;
        case 0x64696163: return self.diacriticals;
        case 0x646f6375: return self.document;
        case 0x636f6d70: return self.doubleInteger;
        case 0x656c696e: return self.elementInfo;
        case 0x656e6373: return self.encodedString;
        case 0x6c776c70: return self.endingPage;
        case 0x656e756d: return self.enumerator;
        case 0x6c776568: return self.errorHandling;
        case 0x6576696e: return self.eventInfo;
        case 0x65787061: return self.expansion;
        case 0x65787465: return self.extendedFloat;
        case 0x6661786e: return self.faxNumber;
        case 0x66656574: return self.feet;
        case 0x6174666e: return self.fileName;
        case 0x66737266: return self.fileRef;
        case 0x66737320: return self.fileSpecification;
        case 0x6675726c: return self.fileURL;
        case 0x66697864: return self.fixed;
        case 0x66706e74: return self.fixedPoint;
        case 0x66726374: return self.fixedRectangle;
        case 0x6c64626c: return self.float128bit;
        case 0x646f7562: return self.float_;
        case 0x6973666c: return self.floating;
        case 0x666f6e74: return self.font;
        case 0x70697366: return self.frontmost;
        case 0x67616c6e: return self.gallons;
        case 0x6772616d: return self.grams;
        case 0x63677478: return self.graphicText;
        case 0x68797068: return self.hyphens;
        case 0x49442020: return self.id_;
        case 0x696e6368: return self.inches;
        case 0x70696478: return self.index;
        case 0x6c6f6e67: return self.integer;
        case 0x69747874: return self.internationalText;
        case 0x696e746c: return self.internationalWritingCode;
        case 0x636f626a: return self.item;
        case 0x6b706964: return self.kernelProcessID;
        case 0x6b67726d: return self.kilograms;
        case 0x6b6d7472: return self.kilometers;
        case 0x6c697374: return self.list;
        case 0x6c697472: return self.liters;
        case 0x696e736c: return self.locationReference;
        case 0x6c667864: return self.longFixed;
        case 0x6c667074: return self.longFixedPoint;
        case 0x6c667263: return self.longFixedRectangle;
        case 0x6c706e74: return self.longPoint;
        case 0x6c726374: return self.longRectangle;
        case 0x706f7274: return self.machPort;
        case 0x6d616368: return self.machine;
        case 0x6d4c6f63: return self.machineLocation;
        case 0x6d657472: return self.meters;
        case 0x6d696c65: return self.miles;
        case 0x69736d6e: return self.miniaturizable;
        case 0x706d6e64: return self.miniaturized;
        case 0x6d736e67: return self.missingValue;
        case 0x706d6f64: return self.modal;
        case 0x696d6f64: return self.modified;
        case 0x706e616d: return self.name;
        case 0x6e6f2020: return self.no;
        case 0x6e756c6c: return self.null;
        case 0x6e756d65: return self.numericStrings;
        case 0x6f7a7320: return self.ounces;
        case 0x6c776c61: return self.pagesAcross;
        case 0x6c776c64: return self.pagesDown;
        case 0x63706172: return self.paragraph;
        case 0x706d696e: return self.parameterInfo;
        case 0x70707468: return self.path;
        case 0x74706d6d: return self.pixelMapRecord;
        case 0x51447074: return self.point;
        case 0x6c627320: return self.pounds;
        case 0x70736574: return self.printSettings;
        case 0x70736e20: return self.processSerialNumber;
        case 0x70414c4c: return self.properties;
        case 0x70726f70: return self.property;
        case 0x70696e66: return self.propertyInfo;
        case 0x70756e63: return self.punctuation;
        case 0x71727473: return self.quarts;
        case 0x7265636f: return self.record;
        case 0x6f626a20: return self.reference;
        case 0x6c777174: return self.requestedPrintTime;
        case 0x7072737a: return self.resizable;
        case 0x74726f74: return self.rotation;
        case 0x73637074: return self.script;
        case 0x73696e67: return self.shortFloat;
        case 0x73686f72: return self.shortInteger;
        case 0x7074737a: return self.size;
        case 0x73716674: return self.squareFeet;
        case 0x73716b6d: return self.squareKilometers;
        case 0x7371726d: return self.squareMeters;
        case 0x73716d69: return self.squareMiles;
        case 0x73717964: return self.squareYards;
        case 0x6c777374: return self.standard;
        case 0x6c776670: return self.startingPage;
        case 0x54455854: return self.string;
        case 0x7374796c: return self.styledClipboardText;
        case 0x53545854: return self.styledText;
        case 0x73757478: return self.styledUnicodeText;
        case 0x7375696e: return self.suiteInfo;
        case 0x74727072: return self.targetPrinter;
        case 0x63747874: return self.text;
        case 0x74737479: return self.textStyleInfo;
        case 0x70746974: return self.titled;
        case 0x74797065: return self.typeClass;
        case 0x6d61676e: return self.unsignedInteger;
        case 0x76657273: return self.version_;
        case 0x70766973: return self.visible;
        case 0x77686974: return self.whitespace;
        case 0x6377696e: return self.window;
        case 0x63776f72: return self.word;
        case 0x70736374: return self.writingCode;
        case 0x79617264: return self.yards;
        case 0x79657320: return self.yes;
        case 0x69737a6d: return self.zoomable;
        case 0x707a756d: return self.zoomed;
        default: return [super aebSymbolForCode: code_];
    }
}
// Types/properties 
+ (AEBSymbol *)April {AEB_RETURN_SYMBOL(@"April", typeType, 0x61707220);}
+ (AEBSymbol *)August {AEB_RETURN_SYMBOL(@"August", typeType, 0x61756720);}
+ (AEBSymbol *)CString {AEB_RETURN_SYMBOL(@"CString", typeType, 0x63737472);}
+ (AEBSymbol *)December {AEB_RETURN_SYMBOL(@"December", typeType, 0x64656320);}
+ (AEBSymbol *)EPSPicture {AEB_RETURN_SYMBOL(@"EPSPicture", typeType, 0x45505320);}
+ (AEBSymbol *)February {AEB_RETURN_SYMBOL(@"February", typeType, 0x66656220);}
+ (AEBSymbol *)Friday {AEB_RETURN_SYMBOL(@"Friday", typeType, 0x66726920);}
+ (AEBSymbol *)GIFPicture {AEB_RETURN_SYMBOL(@"GIFPicture", typeType, 0x47494666);}
+ (AEBSymbol *)JPEGPicture {AEB_RETURN_SYMBOL(@"JPEGPicture", typeType, 0x4a504547);}
+ (AEBSymbol *)January {AEB_RETURN_SYMBOL(@"January", typeType, 0x6a616e20);}
+ (AEBSymbol *)July {AEB_RETURN_SYMBOL(@"July", typeType, 0x6a756c20);}
+ (AEBSymbol *)June {AEB_RETURN_SYMBOL(@"June", typeType, 0x6a756e20);}
+ (AEBSymbol *)March {AEB_RETURN_SYMBOL(@"March", typeType, 0x6d617220);}
+ (AEBSymbol *)May {AEB_RETURN_SYMBOL(@"May", typeType, 0x6d617920);}
+ (AEBSymbol *)Monday {AEB_RETURN_SYMBOL(@"Monday", typeType, 0x6d6f6e20);}
+ (AEBSymbol *)November {AEB_RETURN_SYMBOL(@"November", typeType, 0x6e6f7620);}
+ (AEBSymbol *)October {AEB_RETURN_SYMBOL(@"October", typeType, 0x6f637420);}
+ (AEBSymbol *)PICTPicture {AEB_RETURN_SYMBOL(@"PICTPicture", typeType, 0x50494354);}
+ (AEBSymbol *)PascalString {AEB_RETURN_SYMBOL(@"PascalString", typeType, 0x70737472);}
+ (AEBSymbol *)RGB16Color {AEB_RETURN_SYMBOL(@"RGB16Color", typeType, 0x74723136);}
+ (AEBSymbol *)RGB96Color {AEB_RETURN_SYMBOL(@"RGB96Color", typeType, 0x74723936);}
+ (AEBSymbol *)RGBColor {AEB_RETURN_SYMBOL(@"RGBColor", typeType, 0x63524742);}
+ (AEBSymbol *)Saturday {AEB_RETURN_SYMBOL(@"Saturday", typeType, 0x73617420);}
+ (AEBSymbol *)September {AEB_RETURN_SYMBOL(@"September", typeType, 0x73657020);}
+ (AEBSymbol *)Sunday {AEB_RETURN_SYMBOL(@"Sunday", typeType, 0x73756e20);}
+ (AEBSymbol *)TIFFPicture {AEB_RETURN_SYMBOL(@"TIFFPicture", typeType, 0x54494646);}
+ (AEBSymbol *)Thursday {AEB_RETURN_SYMBOL(@"Thursday", typeType, 0x74687520);}
+ (AEBSymbol *)Tuesday {AEB_RETURN_SYMBOL(@"Tuesday", typeType, 0x74756520);}
+ (AEBSymbol *)UTF16Text {AEB_RETURN_SYMBOL(@"UTF16Text", typeType, 0x75743136);}
+ (AEBSymbol *)UTF8Text {AEB_RETURN_SYMBOL(@"UTF8Text", typeType, 0x75746638);}
+ (AEBSymbol *)UnicodeText {AEB_RETURN_SYMBOL(@"UnicodeText", typeType, 0x75747874);}
+ (AEBSymbol *)Wednesday {AEB_RETURN_SYMBOL(@"Wednesday", typeType, 0x77656420);}
+ (AEBSymbol *)alias {AEB_RETURN_SYMBOL(@"alias", typeType, 0x616c6973);}
+ (AEBSymbol *)anything {AEB_RETURN_SYMBOL(@"anything", typeType, 0x2a2a2a2a);}
+ (AEBSymbol *)application {AEB_RETURN_SYMBOL(@"application", typeType, 0x63617070);}
+ (AEBSymbol *)applicationBundleID {AEB_RETURN_SYMBOL(@"applicationBundleID", typeType, 0x62756e64);}
+ (AEBSymbol *)applicationSignature {AEB_RETURN_SYMBOL(@"applicationSignature", typeType, 0x7369676e);}
+ (AEBSymbol *)applicationURL {AEB_RETURN_SYMBOL(@"applicationURL", typeType, 0x6170726c);}
+ (AEBSymbol *)attachment {AEB_RETURN_SYMBOL(@"attachment", typeType, 0x61747473);}
+ (AEBSymbol *)attributeRun {AEB_RETURN_SYMBOL(@"attributeRun", typeType, 0x63617472);}
+ (AEBSymbol *)best {AEB_RETURN_SYMBOL(@"best", typeType, 0x62657374);}
+ (AEBSymbol *)boolean {AEB_RETURN_SYMBOL(@"boolean", typeType, 0x626f6f6c);}
+ (AEBSymbol *)boundingRectangle {AEB_RETURN_SYMBOL(@"boundingRectangle", typeType, 0x71647274);}
+ (AEBSymbol *)bounds {AEB_RETURN_SYMBOL(@"bounds", typeType, 0x70626e64);}
+ (AEBSymbol *)centimeters {AEB_RETURN_SYMBOL(@"centimeters", typeType, 0x636d7472);}
+ (AEBSymbol *)character {AEB_RETURN_SYMBOL(@"character", typeType, 0x63686120);}
+ (AEBSymbol *)classInfo {AEB_RETURN_SYMBOL(@"classInfo", typeType, 0x67636c69);}
+ (AEBSymbol *)class_ {AEB_RETURN_SYMBOL(@"class_", typeType, 0x70636c73);}
+ (AEBSymbol *)closeable {AEB_RETURN_SYMBOL(@"closeable", typeType, 0x68636c62);}
+ (AEBSymbol *)collating {AEB_RETURN_SYMBOL(@"collating", typeType, 0x6c77636c);}
+ (AEBSymbol *)color {AEB_RETURN_SYMBOL(@"color", typeType, 0x636f6c72);}
+ (AEBSymbol *)colorTable {AEB_RETURN_SYMBOL(@"colorTable", typeType, 0x636c7274);}
+ (AEBSymbol *)copies {AEB_RETURN_SYMBOL(@"copies", typeType, 0x6c776370);}
+ (AEBSymbol *)cubicCentimeters {AEB_RETURN_SYMBOL(@"cubicCentimeters", typeType, 0x63636d74);}
+ (AEBSymbol *)cubicFeet {AEB_RETURN_SYMBOL(@"cubicFeet", typeType, 0x63666574);}
+ (AEBSymbol *)cubicInches {AEB_RETURN_SYMBOL(@"cubicInches", typeType, 0x6375696e);}
+ (AEBSymbol *)cubicMeters {AEB_RETURN_SYMBOL(@"cubicMeters", typeType, 0x636d6574);}
+ (AEBSymbol *)cubicYards {AEB_RETURN_SYMBOL(@"cubicYards", typeType, 0x63797264);}
+ (AEBSymbol *)dashStyle {AEB_RETURN_SYMBOL(@"dashStyle", typeType, 0x74646173);}
+ (AEBSymbol *)data {AEB_RETURN_SYMBOL(@"data", typeType, 0x72646174);}
+ (AEBSymbol *)date {AEB_RETURN_SYMBOL(@"date", typeType, 0x6c647420);}
+ (AEBSymbol *)decimalStruct {AEB_RETURN_SYMBOL(@"decimalStruct", typeType, 0x6465636d);}
+ (AEBSymbol *)degreesCelsius {AEB_RETURN_SYMBOL(@"degreesCelsius", typeType, 0x64656763);}
+ (AEBSymbol *)degreesFahrenheit {AEB_RETURN_SYMBOL(@"degreesFahrenheit", typeType, 0x64656766);}
+ (AEBSymbol *)degreesKelvin {AEB_RETURN_SYMBOL(@"degreesKelvin", typeType, 0x6465676b);}
+ (AEBSymbol *)document {AEB_RETURN_SYMBOL(@"document", typeType, 0x646f6375);}
+ (AEBSymbol *)doubleInteger {AEB_RETURN_SYMBOL(@"doubleInteger", typeType, 0x636f6d70);}
+ (AEBSymbol *)elementInfo {AEB_RETURN_SYMBOL(@"elementInfo", typeType, 0x656c696e);}
+ (AEBSymbol *)encodedString {AEB_RETURN_SYMBOL(@"encodedString", typeType, 0x656e6373);}
+ (AEBSymbol *)endingPage {AEB_RETURN_SYMBOL(@"endingPage", typeType, 0x6c776c70);}
+ (AEBSymbol *)enumerator {AEB_RETURN_SYMBOL(@"enumerator", typeType, 0x656e756d);}
+ (AEBSymbol *)errorHandling {AEB_RETURN_SYMBOL(@"errorHandling", typeType, 0x6c776568);}
+ (AEBSymbol *)eventInfo {AEB_RETURN_SYMBOL(@"eventInfo", typeType, 0x6576696e);}
+ (AEBSymbol *)extendedFloat {AEB_RETURN_SYMBOL(@"extendedFloat", typeType, 0x65787465);}
+ (AEBSymbol *)faxNumber {AEB_RETURN_SYMBOL(@"faxNumber", typeType, 0x6661786e);}
+ (AEBSymbol *)feet {AEB_RETURN_SYMBOL(@"feet", typeType, 0x66656574);}
+ (AEBSymbol *)fileName {AEB_RETURN_SYMBOL(@"fileName", typeType, 0x6174666e);}
+ (AEBSymbol *)fileRef {AEB_RETURN_SYMBOL(@"fileRef", typeType, 0x66737266);}
+ (AEBSymbol *)fileSpecification {AEB_RETURN_SYMBOL(@"fileSpecification", typeType, 0x66737320);}
+ (AEBSymbol *)fileURL {AEB_RETURN_SYMBOL(@"fileURL", typeType, 0x6675726c);}
+ (AEBSymbol *)fixed {AEB_RETURN_SYMBOL(@"fixed", typeType, 0x66697864);}
+ (AEBSymbol *)fixedPoint {AEB_RETURN_SYMBOL(@"fixedPoint", typeType, 0x66706e74);}
+ (AEBSymbol *)fixedRectangle {AEB_RETURN_SYMBOL(@"fixedRectangle", typeType, 0x66726374);}
+ (AEBSymbol *)float128bit {AEB_RETURN_SYMBOL(@"float128bit", typeType, 0x6c64626c);}
+ (AEBSymbol *)float_ {AEB_RETURN_SYMBOL(@"float_", typeType, 0x646f7562);}
+ (AEBSymbol *)floating {AEB_RETURN_SYMBOL(@"floating", typeType, 0x6973666c);}
+ (AEBSymbol *)font {AEB_RETURN_SYMBOL(@"font", typeType, 0x666f6e74);}
+ (AEBSymbol *)frontmost {AEB_RETURN_SYMBOL(@"frontmost", typeType, 0x70697366);}
+ (AEBSymbol *)gallons {AEB_RETURN_SYMBOL(@"gallons", typeType, 0x67616c6e);}
+ (AEBSymbol *)grams {AEB_RETURN_SYMBOL(@"grams", typeType, 0x6772616d);}
+ (AEBSymbol *)graphicText {AEB_RETURN_SYMBOL(@"graphicText", typeType, 0x63677478);}
+ (AEBSymbol *)id_ {AEB_RETURN_SYMBOL(@"id_", typeType, 0x49442020);}
+ (AEBSymbol *)inches {AEB_RETURN_SYMBOL(@"inches", typeType, 0x696e6368);}
+ (AEBSymbol *)index {AEB_RETURN_SYMBOL(@"index", typeType, 0x70696478);}
+ (AEBSymbol *)integer {AEB_RETURN_SYMBOL(@"integer", typeType, 0x6c6f6e67);}
+ (AEBSymbol *)internationalText {AEB_RETURN_SYMBOL(@"internationalText", typeType, 0x69747874);}
+ (AEBSymbol *)internationalWritingCode {AEB_RETURN_SYMBOL(@"internationalWritingCode", typeType, 0x696e746c);}
+ (AEBSymbol *)item {AEB_RETURN_SYMBOL(@"item", typeType, 0x636f626a);}
+ (AEBSymbol *)kernelProcessID {AEB_RETURN_SYMBOL(@"kernelProcessID", typeType, 0x6b706964);}
+ (AEBSymbol *)kilograms {AEB_RETURN_SYMBOL(@"kilograms", typeType, 0x6b67726d);}
+ (AEBSymbol *)kilometers {AEB_RETURN_SYMBOL(@"kilometers", typeType, 0x6b6d7472);}
+ (AEBSymbol *)list {AEB_RETURN_SYMBOL(@"list", typeType, 0x6c697374);}
+ (AEBSymbol *)liters {AEB_RETURN_SYMBOL(@"liters", typeType, 0x6c697472);}
+ (AEBSymbol *)locationReference {AEB_RETURN_SYMBOL(@"locationReference", typeType, 0x696e736c);}
+ (AEBSymbol *)longFixed {AEB_RETURN_SYMBOL(@"longFixed", typeType, 0x6c667864);}
+ (AEBSymbol *)longFixedPoint {AEB_RETURN_SYMBOL(@"longFixedPoint", typeType, 0x6c667074);}
+ (AEBSymbol *)longFixedRectangle {AEB_RETURN_SYMBOL(@"longFixedRectangle", typeType, 0x6c667263);}
+ (AEBSymbol *)longPoint {AEB_RETURN_SYMBOL(@"longPoint", typeType, 0x6c706e74);}
+ (AEBSymbol *)longRectangle {AEB_RETURN_SYMBOL(@"longRectangle", typeType, 0x6c726374);}
+ (AEBSymbol *)machPort {AEB_RETURN_SYMBOL(@"machPort", typeType, 0x706f7274);}
+ (AEBSymbol *)machine {AEB_RETURN_SYMBOL(@"machine", typeType, 0x6d616368);}
+ (AEBSymbol *)machineLocation {AEB_RETURN_SYMBOL(@"machineLocation", typeType, 0x6d4c6f63);}
+ (AEBSymbol *)meters {AEB_RETURN_SYMBOL(@"meters", typeType, 0x6d657472);}
+ (AEBSymbol *)miles {AEB_RETURN_SYMBOL(@"miles", typeType, 0x6d696c65);}
+ (AEBSymbol *)miniaturizable {AEB_RETURN_SYMBOL(@"miniaturizable", typeType, 0x69736d6e);}
+ (AEBSymbol *)miniaturized {AEB_RETURN_SYMBOL(@"miniaturized", typeType, 0x706d6e64);}
+ (AEBSymbol *)missingValue {AEB_RETURN_SYMBOL(@"missingValue", typeType, 0x6d736e67);}
+ (AEBSymbol *)modal {AEB_RETURN_SYMBOL(@"modal", typeType, 0x706d6f64);}
+ (AEBSymbol *)modified {AEB_RETURN_SYMBOL(@"modified", typeType, 0x696d6f64);}
+ (AEBSymbol *)name {AEB_RETURN_SYMBOL(@"name", typeType, 0x706e616d);}
+ (AEBSymbol *)null {AEB_RETURN_SYMBOL(@"null", typeType, 0x6e756c6c);}
+ (AEBSymbol *)ounces {AEB_RETURN_SYMBOL(@"ounces", typeType, 0x6f7a7320);}
+ (AEBSymbol *)pagesAcross {AEB_RETURN_SYMBOL(@"pagesAcross", typeType, 0x6c776c61);}
+ (AEBSymbol *)pagesDown {AEB_RETURN_SYMBOL(@"pagesDown", typeType, 0x6c776c64);}
+ (AEBSymbol *)paragraph {AEB_RETURN_SYMBOL(@"paragraph", typeType, 0x63706172);}
+ (AEBSymbol *)parameterInfo {AEB_RETURN_SYMBOL(@"parameterInfo", typeType, 0x706d696e);}
+ (AEBSymbol *)path {AEB_RETURN_SYMBOL(@"path", typeType, 0x70707468);}
+ (AEBSymbol *)pixelMapRecord {AEB_RETURN_SYMBOL(@"pixelMapRecord", typeType, 0x74706d6d);}
+ (AEBSymbol *)point {AEB_RETURN_SYMBOL(@"point", typeType, 0x51447074);}
+ (AEBSymbol *)pounds {AEB_RETURN_SYMBOL(@"pounds", typeType, 0x6c627320);}
+ (AEBSymbol *)printSettings {AEB_RETURN_SYMBOL(@"printSettings", typeType, 0x70736574);}
+ (AEBSymbol *)processSerialNumber {AEB_RETURN_SYMBOL(@"processSerialNumber", typeType, 0x70736e20);}
+ (AEBSymbol *)properties {AEB_RETURN_SYMBOL(@"properties", typeType, 0x70414c4c);}
+ (AEBSymbol *)property {AEB_RETURN_SYMBOL(@"property", typeType, 0x70726f70);}
+ (AEBSymbol *)propertyInfo {AEB_RETURN_SYMBOL(@"propertyInfo", typeType, 0x70696e66);}
+ (AEBSymbol *)quarts {AEB_RETURN_SYMBOL(@"quarts", typeType, 0x71727473);}
+ (AEBSymbol *)record {AEB_RETURN_SYMBOL(@"record", typeType, 0x7265636f);}
+ (AEBSymbol *)reference {AEB_RETURN_SYMBOL(@"reference", typeType, 0x6f626a20);}
+ (AEBSymbol *)requestedPrintTime {AEB_RETURN_SYMBOL(@"requestedPrintTime", typeType, 0x6c777174);}
+ (AEBSymbol *)resizable {AEB_RETURN_SYMBOL(@"resizable", typeType, 0x7072737a);}
+ (AEBSymbol *)rotation {AEB_RETURN_SYMBOL(@"rotation", typeType, 0x74726f74);}
+ (AEBSymbol *)script {AEB_RETURN_SYMBOL(@"script", typeType, 0x73637074);}
+ (AEBSymbol *)shortFloat {AEB_RETURN_SYMBOL(@"shortFloat", typeType, 0x73696e67);}
+ (AEBSymbol *)shortInteger {AEB_RETURN_SYMBOL(@"shortInteger", typeType, 0x73686f72);}
+ (AEBSymbol *)size {AEB_RETURN_SYMBOL(@"size", typeType, 0x7074737a);}
+ (AEBSymbol *)squareFeet {AEB_RETURN_SYMBOL(@"squareFeet", typeType, 0x73716674);}
+ (AEBSymbol *)squareKilometers {AEB_RETURN_SYMBOL(@"squareKilometers", typeType, 0x73716b6d);}
+ (AEBSymbol *)squareMeters {AEB_RETURN_SYMBOL(@"squareMeters", typeType, 0x7371726d);}
+ (AEBSymbol *)squareMiles {AEB_RETURN_SYMBOL(@"squareMiles", typeType, 0x73716d69);}
+ (AEBSymbol *)squareYards {AEB_RETURN_SYMBOL(@"squareYards", typeType, 0x73717964);}
+ (AEBSymbol *)startingPage {AEB_RETURN_SYMBOL(@"startingPage", typeType, 0x6c776670);}
+ (AEBSymbol *)string {AEB_RETURN_SYMBOL(@"string", typeType, 0x54455854);}
+ (AEBSymbol *)styledClipboardText {AEB_RETURN_SYMBOL(@"styledClipboardText", typeType, 0x7374796c);}
+ (AEBSymbol *)styledText {AEB_RETURN_SYMBOL(@"styledText", typeType, 0x53545854);}
+ (AEBSymbol *)styledUnicodeText {AEB_RETURN_SYMBOL(@"styledUnicodeText", typeType, 0x73757478);}
+ (AEBSymbol *)suiteInfo {AEB_RETURN_SYMBOL(@"suiteInfo", typeType, 0x7375696e);}
+ (AEBSymbol *)targetPrinter {AEB_RETURN_SYMBOL(@"targetPrinter", typeType, 0x74727072);}
+ (AEBSymbol *)text {AEB_RETURN_SYMBOL(@"text", typeType, 0x63747874);}
+ (AEBSymbol *)textStyleInfo {AEB_RETURN_SYMBOL(@"textStyleInfo", typeType, 0x74737479);}
+ (AEBSymbol *)titled {AEB_RETURN_SYMBOL(@"titled", typeType, 0x70746974);}
+ (AEBSymbol *)typeClass {AEB_RETURN_SYMBOL(@"typeClass", typeType, 0x74797065);}
+ (AEBSymbol *)unsignedInteger {AEB_RETURN_SYMBOL(@"unsignedInteger", typeType, 0x6d61676e);}
+ (AEBSymbol *)version_ {AEB_RETURN_SYMBOL(@"version_", typeType, 0x76657273);}
+ (AEBSymbol *)visible {AEB_RETURN_SYMBOL(@"visible", typeType, 0x70766973);}
+ (AEBSymbol *)window {AEB_RETURN_SYMBOL(@"window", typeType, 0x6377696e);}
+ (AEBSymbol *)word {AEB_RETURN_SYMBOL(@"word", typeType, 0x63776f72);}
+ (AEBSymbol *)writingCode {AEB_RETURN_SYMBOL(@"writingCode", typeType, 0x70736374);}
+ (AEBSymbol *)yards {AEB_RETURN_SYMBOL(@"yards", typeType, 0x79617264);}
+ (AEBSymbol *)zoomable {AEB_RETURN_SYMBOL(@"zoomable", typeType, 0x69737a6d);}
+ (AEBSymbol *)zoomed {AEB_RETURN_SYMBOL(@"zoomed", typeType, 0x707a756d);}
// Enumerators
+ (AEBSymbol *)applicationResponses {AEB_RETURN_SYMBOL(@"applicationResponses", typeEnumerated, 0x726d7465);}
+ (AEBSymbol *)ask {AEB_RETURN_SYMBOL(@"ask", typeEnumerated, 0x61736b20);}
+ (AEBSymbol *)case_ {AEB_RETURN_SYMBOL(@"case_", typeEnumerated, 0x63617365);}
+ (AEBSymbol *)detailed {AEB_RETURN_SYMBOL(@"detailed", typeEnumerated, 0x6c776474);}
+ (AEBSymbol *)diacriticals {AEB_RETURN_SYMBOL(@"diacriticals", typeEnumerated, 0x64696163);}
+ (AEBSymbol *)expansion {AEB_RETURN_SYMBOL(@"expansion", typeEnumerated, 0x65787061);}
+ (AEBSymbol *)hyphens {AEB_RETURN_SYMBOL(@"hyphens", typeEnumerated, 0x68797068);}
+ (AEBSymbol *)no {AEB_RETURN_SYMBOL(@"no", typeEnumerated, 0x6e6f2020);}
+ (AEBSymbol *)numericStrings {AEB_RETURN_SYMBOL(@"numericStrings", typeEnumerated, 0x6e756d65);}
+ (AEBSymbol *)punctuation {AEB_RETURN_SYMBOL(@"punctuation", typeEnumerated, 0x70756e63);}
+ (AEBSymbol *)standard {AEB_RETURN_SYMBOL(@"standard", typeEnumerated, 0x6c777374);}
+ (AEBSymbol *)whitespace {AEB_RETURN_SYMBOL(@"whitespace", typeEnumerated, 0x77686974);}
+ (AEBSymbol *)yes {AEB_RETURN_SYMBOL(@"yes", typeEnumerated, 0x79657320);}
@end




@implementation TEDActivateCommand
- (NSString *)aebCommandName {
    return @"activate";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDCloseCommand
- (instancetype)savingIn:(id)value {
    [self setParameter: value forKeyword: 0x6b66696c];
    return self;
}
- (instancetype)saving:(id)value {
    [self setParameter: value forKeyword: 0x7361766f];
    return self;
}
- (NSString *)aebCommandName {
    return @"close";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x6b66696c: return @"savingIn";
        case 0x7361766f: return @"saving";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDCountCommand
- (instancetype)each:(id)value {
    [self setParameter: value forKeyword: 0x6b6f636c];
    return self;
}
- (NSString *)aebCommandName {
    return @"count";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x6b6f636c: return @"each";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDDeleteCommand
- (NSString *)aebCommandName {
    return @"delete";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDDuplicateCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 0x696e7368];
    return self;
}
- (instancetype)withProperties:(id)value {
    [self setParameter: value forKeyword: 0x70726474];
    return self;
}
- (NSString *)aebCommandName {
    return @"duplicate";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x696e7368: return @"to";
        case 0x70726474: return @"withProperties";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDExistsCommand
- (NSString *)aebCommandName {
    return @"exists";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDGetCommand
- (NSString *)aebCommandName {
    return @"get";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDLaunchCommand
- (NSString *)aebCommandName {
    return @"launch";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDMakeCommand
- (instancetype)withData:(id)value {
    [self setParameter: value forKeyword: 0x64617461];
    return self;
}
- (instancetype)at:(id)value {
    [self setParameter: value forKeyword: 0x696e7368];
    return self;
}
- (instancetype)new_:(id)value {
    [self setParameter: value forKeyword: 0x6b6f636c];
    return self;
}
- (instancetype)withProperties:(id)value {
    [self setParameter: value forKeyword: 0x70726474];
    return self;
}
- (NSString *)aebCommandName {
    return @"make";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x64617461: return @"withData";
        case 0x696e7368: return @"at";
        case 0x6b6f636c: return @"new_";
        case 0x70726474: return @"withProperties";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDMoveCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 0x696e7368];
    return self;
}
- (NSString *)aebCommandName {
    return @"move";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x696e7368: return @"to";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDOpenCommand
- (NSString *)aebCommandName {
    return @"open";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDOpenLocationCommand
- (instancetype)window:(id)value {
    [self setParameter: value forKeyword: 0x57494e44];
    return self;
}
- (NSString *)aebCommandName {
    return @"openLocation";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x57494e44: return @"window";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDPrintCommand
- (instancetype)printDialog:(id)value {
    [self setParameter: value forKeyword: 0x70646c67];
    return self;
}
- (instancetype)withProperties:(id)value {
    [self setParameter: value forKeyword: 0x70726474];
    return self;
}
- (NSString *)aebCommandName {
    return @"print";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x70646c67: return @"printDialog";
        case 0x70726474: return @"withProperties";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDQuitCommand
- (instancetype)saving:(id)value {
    [self setParameter: value forKeyword: 0x7361766f];
    return self;
}
- (NSString *)aebCommandName {
    return @"quit";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x7361766f: return @"saving";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDReopenCommand
- (NSString *)aebCommandName {
    return @"reopen";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDRunCommand
- (NSString *)aebCommandName {
    return @"run";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDSaveCommand
- (instancetype)as:(id)value {
    [self setParameter: value forKeyword: 0x666c7470];
    return self;
}
- (instancetype)in_:(id)value {
    [self setParameter: value forKeyword: 0x6b66696c];
    return self;
}
- (NSString *)aebCommandName {
    return @"save";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x666c7470: return @"as";
        case 0x6b66696c: return @"in_";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDSetCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 0x64617461];
    return self;
}
- (NSString *)aebCommandName {
    return @"set";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x64617461: return @"to";
    }
    return [super aebParameterNameForCode: code];
}
@end




@implementation TEDSpecifier
- (NSString *)description {
    return [TEDFormatter formatObject: self.aemQuery appData: self.aebAppData];
}
// Properties
- (instancetype)bounds {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70626e64]];
}
- (instancetype)class_ {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70636c73]];
}
- (instancetype)closeable {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x68636c62]];
}
- (instancetype)collating {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c77636c]];
}
- (instancetype)color {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x636f6c72]];
}
- (instancetype)copies {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776370]];
}
- (instancetype)document {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x646f6375]];
}
- (instancetype)endingPage {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776c70]];
}
- (instancetype)errorHandling {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776568]];
}
- (instancetype)faxNumber {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6661786e]];
}
- (instancetype)fileName {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6174666e]];
}
- (instancetype)floating {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6973666c]];
}
- (instancetype)font {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x666f6e74]];
}
- (instancetype)frontmost {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70697366]];
}
- (instancetype)id_ {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x49442020]];
}
- (instancetype)index {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70696478]];
}
- (instancetype)miniaturizable {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69736d6e]];
}
- (instancetype)miniaturized {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706d6e64]];
}
- (instancetype)modal {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706d6f64]];
}
- (instancetype)modified {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x696d6f64]];
}
- (instancetype)name {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706e616d]];
}
- (instancetype)pagesAcross {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776c61]];
}
- (instancetype)pagesDown {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776c64]];
}
- (instancetype)path {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70707468]];
}
- (instancetype)properties {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70414c4c]];
}
- (instancetype)requestedPrintTime {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c777174]];
}
- (instancetype)resizable {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7072737a]];
}
- (instancetype)size {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7074737a]];
}
- (instancetype)startingPage {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776670]];
}
- (instancetype)targetPrinter {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x74727072]];
}
- (instancetype)titled {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70746974]];
}
- (instancetype)version_ {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x76657273]];
}
- (instancetype)visible {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70766973]];
}
- (instancetype)zoomable {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69737a6d]];
}
- (instancetype)zoomed {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x707a756d]];
}
// Elements
- (instancetype)applications {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63617070]];
}
- (instancetype)attachment {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x61747473]];
}
- (instancetype)attributeRuns {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63617472]];
}
- (instancetype)characters {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63686120]];
}
- (instancetype)colors {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x636f6c72]];
}
- (instancetype)documents {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x646f6375]];
}
- (instancetype)items {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x636f626a]];
}
- (instancetype)paragraphs {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63706172]];
}
- (instancetype)printSettings {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x70736574]];
}
- (instancetype)text {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63747874]];
}
- (instancetype)windows {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x6377696e]];
}
- (instancetype)words {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63776f72]];
}
// Commands
- (TEDActivateCommand *)activate {
    return [TEDActivateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x61637476
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDActivateCommand *)activate:(id)directParameter {
    return [TEDActivateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x61637476
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDCloseCommand *)close {
    return [TEDCloseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f73
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDCloseCommand *)close:(id)directParameter {
    return [TEDCloseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f73
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDCountCommand *)count {
    return [TEDCountCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636e7465
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDCountCommand *)count:(id)directParameter {
    return [TEDCountCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636e7465
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDDeleteCommand *)delete {
    return [TEDDeleteCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x64656c6f
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDDeleteCommand *)delete:(id)directParameter {
    return [TEDDeleteCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x64656c6f
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDDuplicateCommand *)duplicate {
    return [TEDDuplicateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f6e
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDDuplicateCommand *)duplicate:(id)directParameter {
    return [TEDDuplicateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f6e
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDExistsCommand *)exists {
    return [TEDExistsCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x646f6578
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDExistsCommand *)exists:(id)directParameter {
    return [TEDExistsCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x646f6578
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDGetCommand *)get {
    return [TEDGetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x67657464
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDGetCommand *)get:(id)directParameter {
    return [TEDGetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x67657464
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDLaunchCommand *)launch {
    return [TEDLaunchCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61736372
                          eventID: 0x6e6f6f70
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDLaunchCommand *)launch:(id)directParameter {
    return [TEDLaunchCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61736372
                          eventID: 0x6e6f6f70
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDMakeCommand *)make {
    return [TEDMakeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6372656c
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDMakeCommand *)make:(id)directParameter {
    return [TEDMakeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6372656c
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDMoveCommand *)move {
    return [TEDMoveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6d6f7665
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDMoveCommand *)move:(id)directParameter {
    return [TEDMoveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6d6f7665
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDOpenCommand *)open {
    return [TEDOpenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f646f63
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDOpenCommand *)open:(id)directParameter {
    return [TEDOpenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f646f63
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDOpenLocationCommand *)openLocation {
    return [TEDOpenLocationCommand commandWithAppData: self.aebAppData
                       eventClass: 0x4755524c
                          eventID: 0x4755524c
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDOpenLocationCommand *)openLocation:(id)directParameter {
    return [TEDOpenLocationCommand commandWithAppData: self.aebAppData
                       eventClass: 0x4755524c
                          eventID: 0x4755524c
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDPrintCommand *)print {
    return [TEDPrintCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x70646f63
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDPrintCommand *)print:(id)directParameter {
    return [TEDPrintCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x70646f63
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDQuitCommand *)quit {
    return [TEDQuitCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x71756974
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDQuitCommand *)quit:(id)directParameter {
    return [TEDQuitCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x71756974
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDReopenCommand *)reopen {
    return [TEDReopenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x72617070
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDReopenCommand *)reopen:(id)directParameter {
    return [TEDReopenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x72617070
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDRunCommand *)run {
    return [TEDRunCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f617070
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDRunCommand *)run:(id)directParameter {
    return [TEDRunCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f617070
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDSaveCommand *)save {
    return [TEDSaveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73617665
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDSaveCommand *)save:(id)directParameter {
    return [TEDSaveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73617665
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDSetCommand *)set {
    return [TEDSetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73657464
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDSetCommand *)set:(id)directParameter {
    return [TEDSetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73657464
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
@end




@implementation TEDApplication

/* note: clients shouldn't need to call -initWithTargetType:data: themselves */

- (instancetype)initWithTargetType:(AEBTargetType)targetType_ data:(id)targetData_ {
    AEBStaticAppData *data = [[AEBStaticAppData alloc] initWithTargetType: targetType_
                                                               targetData: targetData_
                                                            launchOptions: kAEMDefaultLaunchOptions
                                                             relaunchMode: AEBRelaunchLimited
                                                           specifierClass: TEDSpecifier.class
                                                              symbolClass: TEDSymbol.class]; // non-ARC: add autorelease
    return [super initWithAppData: data aemQuery: AEMApp];
}

/* initialisers */

+ (instancetype)application {
    return [[self alloc] init];
}
+ (instancetype)currentApplication {
    return [[self alloc] initCurrentApplication]; // non-ARC: add autorelease
}
+ (instancetype)applicationWithName:(NSString *)name {
    return [[self alloc] initWithName: name]; // non-ARC: add autorelease
}
+ (instancetype)applicationWithURL:(NSURL *)url {
    return [[self alloc] initWithURL: url]; // non-ARC: add autorelease
}
+ (instancetype)applicationWithBundleID:(NSString *)bundleID {
    return [[self alloc] initWithBundleID: bundleID]; // non-ARC: add autorelease
}
+ (instancetype)applicationWithProcessID:(pid_t)pid {
    return [[self alloc] initWithProcessID: pid]; // non-ARC: add autorelease
}
+ (instancetype)applicationWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [[self alloc] initWithDescriptor: desc]; // non-ARC: add autorelease
}
- (instancetype)init {
    return [self initWithBundleID: @"com.apple.TextEdit"];
}
- (instancetype)initCurrentApplication {
    return [self initWithTargetType: AEBTargetCurrent data: nil];
}
- (instancetype)initWithName:(NSString *)name {
    return [self initWithTargetType: AEBTargetName data: name];
}
- (instancetype)initWithURL:(NSURL *)url {
    return [self initWithTargetType: AEBTargetURL data: url];
}
- (instancetype)initWithBundleID:(NSString *)bundleID {
    return [self initWithTargetType: AEBTargetBundleID data: bundleID];
}
- (instancetype)initWithProcessID:(pid_t)pid {
    return [self initWithTargetType: AEBTargetProcessID data: [NSNumber numberWithInteger: pid]];
}
- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [self initWithTargetType: AEBTargetDescriptor data: desc];
}

/* misc */

- (TEDSpecifier *)customRoot:(id)object {
    if ([object isKindOfClass: TEDSpecifier.class]) {
        return [[TEDSpecifier alloc] initWithAppData: self.aebAppData aemQuery: [object aemQuery]]; // non-ARC: add autorelease
    } else if ([object isKindOfClass: AEMQuery.class]) {
        return [[TEDSpecifier alloc] initWithAppData: self.aebAppData aemQuery: object];  // non-ARC: add autorelease
    } else if (!object) {
        return [[TEDSpecifier alloc] initWithAppData: self.aebAppData aemQuery: AEMApp];  // non-ARC: add autorelease
    } else {
        return [[TEDSpecifier alloc] initWithAppData: self.aebAppData aemQuery: AEMRoot(object)]; // non-ARC: add autorelease
    }
}
@end

