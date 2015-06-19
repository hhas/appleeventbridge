//
// TEGlue.m
// TextEdit 1.11
// AppleEventBridge.framework 0.7.0
//

#import "TEGlue.h"


@implementation TEFormatter
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
    return @"TE";
}
@end




@implementation TESymbol
+ (instancetype)symbolWithCode:(OSType)code_ {
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
        default: return [super symbolWithCode: code_];
    }
}
// Types/properties 
+ (instancetype)April {AEB_RETURN_SYMBOL(@"April", typeType, 0x61707220);}
+ (instancetype)August {AEB_RETURN_SYMBOL(@"August", typeType, 0x61756720);}
+ (instancetype)CString {AEB_RETURN_SYMBOL(@"CString", typeType, 0x63737472);}
+ (instancetype)December {AEB_RETURN_SYMBOL(@"December", typeType, 0x64656320);}
+ (instancetype)EPSPicture {AEB_RETURN_SYMBOL(@"EPSPicture", typeType, 0x45505320);}
+ (instancetype)February {AEB_RETURN_SYMBOL(@"February", typeType, 0x66656220);}
+ (instancetype)Friday {AEB_RETURN_SYMBOL(@"Friday", typeType, 0x66726920);}
+ (instancetype)GIFPicture {AEB_RETURN_SYMBOL(@"GIFPicture", typeType, 0x47494666);}
+ (instancetype)JPEGPicture {AEB_RETURN_SYMBOL(@"JPEGPicture", typeType, 0x4a504547);}
+ (instancetype)January {AEB_RETURN_SYMBOL(@"January", typeType, 0x6a616e20);}
+ (instancetype)July {AEB_RETURN_SYMBOL(@"July", typeType, 0x6a756c20);}
+ (instancetype)June {AEB_RETURN_SYMBOL(@"June", typeType, 0x6a756e20);}
+ (instancetype)March {AEB_RETURN_SYMBOL(@"March", typeType, 0x6d617220);}
+ (instancetype)May {AEB_RETURN_SYMBOL(@"May", typeType, 0x6d617920);}
+ (instancetype)Monday {AEB_RETURN_SYMBOL(@"Monday", typeType, 0x6d6f6e20);}
+ (instancetype)November {AEB_RETURN_SYMBOL(@"November", typeType, 0x6e6f7620);}
+ (instancetype)October {AEB_RETURN_SYMBOL(@"October", typeType, 0x6f637420);}
+ (instancetype)PICTPicture {AEB_RETURN_SYMBOL(@"PICTPicture", typeType, 0x50494354);}
+ (instancetype)PascalString {AEB_RETURN_SYMBOL(@"PascalString", typeType, 0x70737472);}
+ (instancetype)RGB16Color {AEB_RETURN_SYMBOL(@"RGB16Color", typeType, 0x74723136);}
+ (instancetype)RGB96Color {AEB_RETURN_SYMBOL(@"RGB96Color", typeType, 0x74723936);}
+ (instancetype)RGBColor {AEB_RETURN_SYMBOL(@"RGBColor", typeType, 0x63524742);}
+ (instancetype)Saturday {AEB_RETURN_SYMBOL(@"Saturday", typeType, 0x73617420);}
+ (instancetype)September {AEB_RETURN_SYMBOL(@"September", typeType, 0x73657020);}
+ (instancetype)Sunday {AEB_RETURN_SYMBOL(@"Sunday", typeType, 0x73756e20);}
+ (instancetype)TIFFPicture {AEB_RETURN_SYMBOL(@"TIFFPicture", typeType, 0x54494646);}
+ (instancetype)Thursday {AEB_RETURN_SYMBOL(@"Thursday", typeType, 0x74687520);}
+ (instancetype)Tuesday {AEB_RETURN_SYMBOL(@"Tuesday", typeType, 0x74756520);}
+ (instancetype)UTF16Text {AEB_RETURN_SYMBOL(@"UTF16Text", typeType, 0x75743136);}
+ (instancetype)UTF8Text {AEB_RETURN_SYMBOL(@"UTF8Text", typeType, 0x75746638);}
+ (instancetype)UnicodeText {AEB_RETURN_SYMBOL(@"UnicodeText", typeType, 0x75747874);}
+ (instancetype)Wednesday {AEB_RETURN_SYMBOL(@"Wednesday", typeType, 0x77656420);}
+ (instancetype)alias {AEB_RETURN_SYMBOL(@"alias", typeType, 0x616c6973);}
+ (instancetype)anything {AEB_RETURN_SYMBOL(@"anything", typeType, 0x2a2a2a2a);}
+ (instancetype)application {AEB_RETURN_SYMBOL(@"application", typeType, 0x63617070);}
+ (instancetype)applicationBundleID {AEB_RETURN_SYMBOL(@"applicationBundleID", typeType, 0x62756e64);}
+ (instancetype)applicationSignature {AEB_RETURN_SYMBOL(@"applicationSignature", typeType, 0x7369676e);}
+ (instancetype)applicationURL {AEB_RETURN_SYMBOL(@"applicationURL", typeType, 0x6170726c);}
+ (instancetype)attachment {AEB_RETURN_SYMBOL(@"attachment", typeType, 0x61747473);}
+ (instancetype)attributeRun {AEB_RETURN_SYMBOL(@"attributeRun", typeType, 0x63617472);}
+ (instancetype)best {AEB_RETURN_SYMBOL(@"best", typeType, 0x62657374);}
+ (instancetype)boolean {AEB_RETURN_SYMBOL(@"boolean", typeType, 0x626f6f6c);}
+ (instancetype)boundingRectangle {AEB_RETURN_SYMBOL(@"boundingRectangle", typeType, 0x71647274);}
+ (instancetype)bounds {AEB_RETURN_SYMBOL(@"bounds", typeType, 0x70626e64);}
+ (instancetype)centimeters {AEB_RETURN_SYMBOL(@"centimeters", typeType, 0x636d7472);}
+ (instancetype)character {AEB_RETURN_SYMBOL(@"character", typeType, 0x63686120);}
+ (instancetype)classInfo {AEB_RETURN_SYMBOL(@"classInfo", typeType, 0x67636c69);}
+ (instancetype)class_ {AEB_RETURN_SYMBOL(@"class_", typeType, 0x70636c73);}
+ (instancetype)closeable {AEB_RETURN_SYMBOL(@"closeable", typeType, 0x68636c62);}
+ (instancetype)collating {AEB_RETURN_SYMBOL(@"collating", typeType, 0x6c77636c);}
+ (instancetype)color {AEB_RETURN_SYMBOL(@"color", typeType, 0x636f6c72);}
+ (instancetype)colorTable {AEB_RETURN_SYMBOL(@"colorTable", typeType, 0x636c7274);}
+ (instancetype)copies {AEB_RETURN_SYMBOL(@"copies", typeType, 0x6c776370);}
+ (instancetype)cubicCentimeters {AEB_RETURN_SYMBOL(@"cubicCentimeters", typeType, 0x63636d74);}
+ (instancetype)cubicFeet {AEB_RETURN_SYMBOL(@"cubicFeet", typeType, 0x63666574);}
+ (instancetype)cubicInches {AEB_RETURN_SYMBOL(@"cubicInches", typeType, 0x6375696e);}
+ (instancetype)cubicMeters {AEB_RETURN_SYMBOL(@"cubicMeters", typeType, 0x636d6574);}
+ (instancetype)cubicYards {AEB_RETURN_SYMBOL(@"cubicYards", typeType, 0x63797264);}
+ (instancetype)dashStyle {AEB_RETURN_SYMBOL(@"dashStyle", typeType, 0x74646173);}
+ (instancetype)data {AEB_RETURN_SYMBOL(@"data", typeType, 0x72646174);}
+ (instancetype)date {AEB_RETURN_SYMBOL(@"date", typeType, 0x6c647420);}
+ (instancetype)decimalStruct {AEB_RETURN_SYMBOL(@"decimalStruct", typeType, 0x6465636d);}
+ (instancetype)degreesCelsius {AEB_RETURN_SYMBOL(@"degreesCelsius", typeType, 0x64656763);}
+ (instancetype)degreesFahrenheit {AEB_RETURN_SYMBOL(@"degreesFahrenheit", typeType, 0x64656766);}
+ (instancetype)degreesKelvin {AEB_RETURN_SYMBOL(@"degreesKelvin", typeType, 0x6465676b);}
+ (instancetype)document {AEB_RETURN_SYMBOL(@"document", typeType, 0x646f6375);}
+ (instancetype)doubleInteger {AEB_RETURN_SYMBOL(@"doubleInteger", typeType, 0x636f6d70);}
+ (instancetype)elementInfo {AEB_RETURN_SYMBOL(@"elementInfo", typeType, 0x656c696e);}
+ (instancetype)encodedString {AEB_RETURN_SYMBOL(@"encodedString", typeType, 0x656e6373);}
+ (instancetype)endingPage {AEB_RETURN_SYMBOL(@"endingPage", typeType, 0x6c776c70);}
+ (instancetype)enumerator {AEB_RETURN_SYMBOL(@"enumerator", typeType, 0x656e756d);}
+ (instancetype)errorHandling {AEB_RETURN_SYMBOL(@"errorHandling", typeType, 0x6c776568);}
+ (instancetype)eventInfo {AEB_RETURN_SYMBOL(@"eventInfo", typeType, 0x6576696e);}
+ (instancetype)extendedFloat {AEB_RETURN_SYMBOL(@"extendedFloat", typeType, 0x65787465);}
+ (instancetype)faxNumber {AEB_RETURN_SYMBOL(@"faxNumber", typeType, 0x6661786e);}
+ (instancetype)feet {AEB_RETURN_SYMBOL(@"feet", typeType, 0x66656574);}
+ (instancetype)fileName {AEB_RETURN_SYMBOL(@"fileName", typeType, 0x6174666e);}
+ (instancetype)fileRef {AEB_RETURN_SYMBOL(@"fileRef", typeType, 0x66737266);}
+ (instancetype)fileSpecification {AEB_RETURN_SYMBOL(@"fileSpecification", typeType, 0x66737320);}
+ (instancetype)fileURL {AEB_RETURN_SYMBOL(@"fileURL", typeType, 0x6675726c);}
+ (instancetype)fixed {AEB_RETURN_SYMBOL(@"fixed", typeType, 0x66697864);}
+ (instancetype)fixedPoint {AEB_RETURN_SYMBOL(@"fixedPoint", typeType, 0x66706e74);}
+ (instancetype)fixedRectangle {AEB_RETURN_SYMBOL(@"fixedRectangle", typeType, 0x66726374);}
+ (instancetype)float128bit {AEB_RETURN_SYMBOL(@"float128bit", typeType, 0x6c64626c);}
+ (instancetype)float_ {AEB_RETURN_SYMBOL(@"float_", typeType, 0x646f7562);}
+ (instancetype)floating {AEB_RETURN_SYMBOL(@"floating", typeType, 0x6973666c);}
+ (instancetype)font {AEB_RETURN_SYMBOL(@"font", typeType, 0x666f6e74);}
+ (instancetype)frontmost {AEB_RETURN_SYMBOL(@"frontmost", typeType, 0x70697366);}
+ (instancetype)gallons {AEB_RETURN_SYMBOL(@"gallons", typeType, 0x67616c6e);}
+ (instancetype)grams {AEB_RETURN_SYMBOL(@"grams", typeType, 0x6772616d);}
+ (instancetype)graphicText {AEB_RETURN_SYMBOL(@"graphicText", typeType, 0x63677478);}
+ (instancetype)id_ {AEB_RETURN_SYMBOL(@"id_", typeType, 0x49442020);}
+ (instancetype)inches {AEB_RETURN_SYMBOL(@"inches", typeType, 0x696e6368);}
+ (instancetype)index {AEB_RETURN_SYMBOL(@"index", typeType, 0x70696478);}
+ (instancetype)integer {AEB_RETURN_SYMBOL(@"integer", typeType, 0x6c6f6e67);}
+ (instancetype)internationalText {AEB_RETURN_SYMBOL(@"internationalText", typeType, 0x69747874);}
+ (instancetype)internationalWritingCode {AEB_RETURN_SYMBOL(@"internationalWritingCode", typeType, 0x696e746c);}
+ (instancetype)item {AEB_RETURN_SYMBOL(@"item", typeType, 0x636f626a);}
+ (instancetype)kernelProcessID {AEB_RETURN_SYMBOL(@"kernelProcessID", typeType, 0x6b706964);}
+ (instancetype)kilograms {AEB_RETURN_SYMBOL(@"kilograms", typeType, 0x6b67726d);}
+ (instancetype)kilometers {AEB_RETURN_SYMBOL(@"kilometers", typeType, 0x6b6d7472);}
+ (instancetype)list {AEB_RETURN_SYMBOL(@"list", typeType, 0x6c697374);}
+ (instancetype)liters {AEB_RETURN_SYMBOL(@"liters", typeType, 0x6c697472);}
+ (instancetype)locationReference {AEB_RETURN_SYMBOL(@"locationReference", typeType, 0x696e736c);}
+ (instancetype)longFixed {AEB_RETURN_SYMBOL(@"longFixed", typeType, 0x6c667864);}
+ (instancetype)longFixedPoint {AEB_RETURN_SYMBOL(@"longFixedPoint", typeType, 0x6c667074);}
+ (instancetype)longFixedRectangle {AEB_RETURN_SYMBOL(@"longFixedRectangle", typeType, 0x6c667263);}
+ (instancetype)longPoint {AEB_RETURN_SYMBOL(@"longPoint", typeType, 0x6c706e74);}
+ (instancetype)longRectangle {AEB_RETURN_SYMBOL(@"longRectangle", typeType, 0x6c726374);}
+ (instancetype)machPort {AEB_RETURN_SYMBOL(@"machPort", typeType, 0x706f7274);}
+ (instancetype)machine {AEB_RETURN_SYMBOL(@"machine", typeType, 0x6d616368);}
+ (instancetype)machineLocation {AEB_RETURN_SYMBOL(@"machineLocation", typeType, 0x6d4c6f63);}
+ (instancetype)meters {AEB_RETURN_SYMBOL(@"meters", typeType, 0x6d657472);}
+ (instancetype)miles {AEB_RETURN_SYMBOL(@"miles", typeType, 0x6d696c65);}
+ (instancetype)miniaturizable {AEB_RETURN_SYMBOL(@"miniaturizable", typeType, 0x69736d6e);}
+ (instancetype)miniaturized {AEB_RETURN_SYMBOL(@"miniaturized", typeType, 0x706d6e64);}
+ (instancetype)missingValue {AEB_RETURN_SYMBOL(@"missingValue", typeType, 0x6d736e67);}
+ (instancetype)modal {AEB_RETURN_SYMBOL(@"modal", typeType, 0x706d6f64);}
+ (instancetype)modified {AEB_RETURN_SYMBOL(@"modified", typeType, 0x696d6f64);}
+ (instancetype)name {AEB_RETURN_SYMBOL(@"name", typeType, 0x706e616d);}
+ (instancetype)null {AEB_RETURN_SYMBOL(@"null", typeType, 0x6e756c6c);}
+ (instancetype)ounces {AEB_RETURN_SYMBOL(@"ounces", typeType, 0x6f7a7320);}
+ (instancetype)pagesAcross {AEB_RETURN_SYMBOL(@"pagesAcross", typeType, 0x6c776c61);}
+ (instancetype)pagesDown {AEB_RETURN_SYMBOL(@"pagesDown", typeType, 0x6c776c64);}
+ (instancetype)paragraph {AEB_RETURN_SYMBOL(@"paragraph", typeType, 0x63706172);}
+ (instancetype)parameterInfo {AEB_RETURN_SYMBOL(@"parameterInfo", typeType, 0x706d696e);}
+ (instancetype)path {AEB_RETURN_SYMBOL(@"path", typeType, 0x70707468);}
+ (instancetype)pixelMapRecord {AEB_RETURN_SYMBOL(@"pixelMapRecord", typeType, 0x74706d6d);}
+ (instancetype)point {AEB_RETURN_SYMBOL(@"point", typeType, 0x51447074);}
+ (instancetype)pounds {AEB_RETURN_SYMBOL(@"pounds", typeType, 0x6c627320);}
+ (instancetype)printSettings {AEB_RETURN_SYMBOL(@"printSettings", typeType, 0x70736574);}
+ (instancetype)processSerialNumber {AEB_RETURN_SYMBOL(@"processSerialNumber", typeType, 0x70736e20);}
+ (instancetype)properties {AEB_RETURN_SYMBOL(@"properties", typeType, 0x70414c4c);}
+ (instancetype)property {AEB_RETURN_SYMBOL(@"property", typeType, 0x70726f70);}
+ (instancetype)propertyInfo {AEB_RETURN_SYMBOL(@"propertyInfo", typeType, 0x70696e66);}
+ (instancetype)quarts {AEB_RETURN_SYMBOL(@"quarts", typeType, 0x71727473);}
+ (instancetype)record {AEB_RETURN_SYMBOL(@"record", typeType, 0x7265636f);}
+ (instancetype)reference {AEB_RETURN_SYMBOL(@"reference", typeType, 0x6f626a20);}
+ (instancetype)requestedPrintTime {AEB_RETURN_SYMBOL(@"requestedPrintTime", typeType, 0x6c777174);}
+ (instancetype)resizable {AEB_RETURN_SYMBOL(@"resizable", typeType, 0x7072737a);}
+ (instancetype)rotation {AEB_RETURN_SYMBOL(@"rotation", typeType, 0x74726f74);}
+ (instancetype)script {AEB_RETURN_SYMBOL(@"script", typeType, 0x73637074);}
+ (instancetype)shortFloat {AEB_RETURN_SYMBOL(@"shortFloat", typeType, 0x73696e67);}
+ (instancetype)shortInteger {AEB_RETURN_SYMBOL(@"shortInteger", typeType, 0x73686f72);}
+ (instancetype)size {AEB_RETURN_SYMBOL(@"size", typeType, 0x7074737a);}
+ (instancetype)squareFeet {AEB_RETURN_SYMBOL(@"squareFeet", typeType, 0x73716674);}
+ (instancetype)squareKilometers {AEB_RETURN_SYMBOL(@"squareKilometers", typeType, 0x73716b6d);}
+ (instancetype)squareMeters {AEB_RETURN_SYMBOL(@"squareMeters", typeType, 0x7371726d);}
+ (instancetype)squareMiles {AEB_RETURN_SYMBOL(@"squareMiles", typeType, 0x73716d69);}
+ (instancetype)squareYards {AEB_RETURN_SYMBOL(@"squareYards", typeType, 0x73717964);}
+ (instancetype)startingPage {AEB_RETURN_SYMBOL(@"startingPage", typeType, 0x6c776670);}
+ (instancetype)string {AEB_RETURN_SYMBOL(@"string", typeType, 0x54455854);}
+ (instancetype)styledClipboardText {AEB_RETURN_SYMBOL(@"styledClipboardText", typeType, 0x7374796c);}
+ (instancetype)styledText {AEB_RETURN_SYMBOL(@"styledText", typeType, 0x53545854);}
+ (instancetype)styledUnicodeText {AEB_RETURN_SYMBOL(@"styledUnicodeText", typeType, 0x73757478);}
+ (instancetype)suiteInfo {AEB_RETURN_SYMBOL(@"suiteInfo", typeType, 0x7375696e);}
+ (instancetype)targetPrinter {AEB_RETURN_SYMBOL(@"targetPrinter", typeType, 0x74727072);}
+ (instancetype)text {AEB_RETURN_SYMBOL(@"text", typeType, 0x63747874);}
+ (instancetype)textStyleInfo {AEB_RETURN_SYMBOL(@"textStyleInfo", typeType, 0x74737479);}
+ (instancetype)titled {AEB_RETURN_SYMBOL(@"titled", typeType, 0x70746974);}
+ (instancetype)typeClass {AEB_RETURN_SYMBOL(@"typeClass", typeType, 0x74797065);}
+ (instancetype)unsignedInteger {AEB_RETURN_SYMBOL(@"unsignedInteger", typeType, 0x6d61676e);}
+ (instancetype)version_ {AEB_RETURN_SYMBOL(@"version_", typeType, 0x76657273);}
+ (instancetype)visible {AEB_RETURN_SYMBOL(@"visible", typeType, 0x70766973);}
+ (instancetype)window {AEB_RETURN_SYMBOL(@"window", typeType, 0x6377696e);}
+ (instancetype)word {AEB_RETURN_SYMBOL(@"word", typeType, 0x63776f72);}
+ (instancetype)writingCode {AEB_RETURN_SYMBOL(@"writingCode", typeType, 0x70736374);}
+ (instancetype)yards {AEB_RETURN_SYMBOL(@"yards", typeType, 0x79617264);}
+ (instancetype)zoomable {AEB_RETURN_SYMBOL(@"zoomable", typeType, 0x69737a6d);}
+ (instancetype)zoomed {AEB_RETURN_SYMBOL(@"zoomed", typeType, 0x707a756d);}
// Enumerators
+ (instancetype)applicationResponses {AEB_RETURN_SYMBOL(@"applicationResponses", typeEnumerated, 0x726d7465);}
+ (instancetype)ask {AEB_RETURN_SYMBOL(@"ask", typeEnumerated, 0x61736b20);}
+ (instancetype)case_ {AEB_RETURN_SYMBOL(@"case_", typeEnumerated, 0x63617365);}
+ (instancetype)detailed {AEB_RETURN_SYMBOL(@"detailed", typeEnumerated, 0x6c776474);}
+ (instancetype)diacriticals {AEB_RETURN_SYMBOL(@"diacriticals", typeEnumerated, 0x64696163);}
+ (instancetype)expansion {AEB_RETURN_SYMBOL(@"expansion", typeEnumerated, 0x65787061);}
+ (instancetype)hyphens {AEB_RETURN_SYMBOL(@"hyphens", typeEnumerated, 0x68797068);}
+ (instancetype)no {AEB_RETURN_SYMBOL(@"no", typeEnumerated, 0x6e6f2020);}
+ (instancetype)numericStrings {AEB_RETURN_SYMBOL(@"numericStrings", typeEnumerated, 0x6e756d65);}
+ (instancetype)punctuation {AEB_RETURN_SYMBOL(@"punctuation", typeEnumerated, 0x70756e63);}
+ (instancetype)standard {AEB_RETURN_SYMBOL(@"standard", typeEnumerated, 0x6c777374);}
+ (instancetype)whitespace {AEB_RETURN_SYMBOL(@"whitespace", typeEnumerated, 0x77686974);}
+ (instancetype)yes {AEB_RETURN_SYMBOL(@"yes", typeEnumerated, 0x79657320);}
@end




@implementation TEActivateCommand
- (NSString *)aebCommandName {
    return @"activate";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TECloseCommand
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

@implementation TECountCommand
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

@implementation TEDeleteCommand
- (NSString *)aebCommandName {
    return @"delete";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEDuplicateCommand
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

@implementation TEExistsCommand
- (NSString *)aebCommandName {
    return @"exists";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEGetCommand
- (NSString *)aebCommandName {
    return @"get";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TELaunchCommand
- (NSString *)aebCommandName {
    return @"launch";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEMakeCommand
- (instancetype)withData:(id)value {
    [self setParameter: value forKeyword: 0x64617461];
    return self;
}
- (instancetype)at_:(id)value {
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
        case 0x696e7368: return @"at_";
        case 0x6b6f636c: return @"new_";
        case 0x70726474: return @"withProperties";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEMoveCommand
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

@implementation TEOpenCommand
- (NSString *)aebCommandName {
    return @"open";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TEOpenLocationCommand
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

@implementation TEPrintCommand
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

@implementation TEQuitCommand
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

@implementation TEReopenCommand
- (NSString *)aebCommandName {
    return @"reopen";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TERunCommand
- (NSString *)aebCommandName {
    return @"run";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation TESaveCommand
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

@implementation TESetCommand
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




@implementation TESpecifier
- (NSString *)description {
    return [TEFormatter formatObject: self.aemQuery appData: self.aebAppData];
}
// Properties
- (instancetype)bounds {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70626e64]];
}
- (instancetype)class_ {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70636c73]];
}
- (instancetype)closeable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x68636c62]];
}
- (instancetype)collating {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c77636c]];
}
- (instancetype)color {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x636f6c72]];
}
- (instancetype)copies {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776370]];
}
- (instancetype)document {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x646f6375]];
}
- (instancetype)endingPage {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776c70]];
}
- (instancetype)errorHandling {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776568]];
}
- (instancetype)faxNumber {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6661786e]];
}
- (instancetype)fileName {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6174666e]];
}
- (instancetype)floating {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6973666c]];
}
- (instancetype)font {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x666f6e74]];
}
- (instancetype)frontmost {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70697366]];
}
- (instancetype)id_ {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x49442020]];
}
- (instancetype)index {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70696478]];
}
- (instancetype)miniaturizable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69736d6e]];
}
- (instancetype)miniaturized {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706d6e64]];
}
- (instancetype)modal {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706d6f64]];
}
- (instancetype)modified {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x696d6f64]];
}
- (instancetype)name {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706e616d]];
}
- (instancetype)pagesAcross {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776c61]];
}
- (instancetype)pagesDown {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776c64]];
}
- (instancetype)path {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70707468]];
}
- (instancetype)properties {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70414c4c]];
}
- (instancetype)requestedPrintTime {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c777174]];
}
- (instancetype)resizable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7072737a]];
}
- (instancetype)size {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7074737a]];
}
- (instancetype)startingPage {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776670]];
}
- (instancetype)targetPrinter {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x74727072]];
}
- (instancetype)titled {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70746974]];
}
- (instancetype)version_ {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x76657273]];
}
- (instancetype)visible {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70766973]];
}
- (instancetype)zoomable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69737a6d]];
}
- (instancetype)zoomed {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x707a756d]];
}
// Elements
- (instancetype)applications {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63617070]];
}
- (instancetype)attachment {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x61747473]];
}
- (instancetype)attributeRuns {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63617472]];
}
- (instancetype)characters {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63686120]];
}
- (instancetype)colors {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x636f6c72]];
}
- (instancetype)documents {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x646f6375]];
}
- (instancetype)items {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x636f626a]];
}
- (instancetype)paragraphs {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63706172]];
}
- (instancetype)printSettings {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x70736574]];
}
- (instancetype)text {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63747874]];
}
- (instancetype)windows {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x6377696e]];
}
- (instancetype)words {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63776f72]];
}
// Commands
- (TEActivateCommand *)activate {
    return [TEActivateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x61637476
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEActivateCommand *)activate:(id)directParameter {
    return [TEActivateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x61637476
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TECloseCommand *)close {
    return [TECloseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f73
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TECloseCommand *)close:(id)directParameter {
    return [TECloseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f73
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TECountCommand *)count {
    return [TECountCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636e7465
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TECountCommand *)count:(id)directParameter {
    return [TECountCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636e7465
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDeleteCommand *)delete {
    return [TEDeleteCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x64656c6f
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDeleteCommand *)delete:(id)directParameter {
    return [TEDeleteCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x64656c6f
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEDuplicateCommand *)duplicate {
    return [TEDuplicateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f6e
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEDuplicateCommand *)duplicate:(id)directParameter {
    return [TEDuplicateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f6e
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEExistsCommand *)exists {
    return [TEExistsCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x646f6578
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEExistsCommand *)exists:(id)directParameter {
    return [TEExistsCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x646f6578
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEGetCommand *)get {
    return [TEGetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x67657464
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEGetCommand *)get:(id)directParameter {
    return [TEGetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x67657464
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TELaunchCommand *)launch {
    return [TELaunchCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61736372
                          eventID: 0x6e6f6f70
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TELaunchCommand *)launch:(id)directParameter {
    return [TELaunchCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61736372
                          eventID: 0x6e6f6f70
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEMakeCommand *)make {
    return [TEMakeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6372656c
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEMakeCommand *)make:(id)directParameter {
    return [TEMakeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6372656c
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEMoveCommand *)move {
    return [TEMoveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6d6f7665
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEMoveCommand *)move:(id)directParameter {
    return [TEMoveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6d6f7665
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEOpenCommand *)open {
    return [TEOpenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f646f63
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEOpenCommand *)open:(id)directParameter {
    return [TEOpenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f646f63
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEOpenLocationCommand *)openLocation {
    return [TEOpenLocationCommand commandWithAppData: self.aebAppData
                       eventClass: 0x4755524c
                          eventID: 0x4755524c
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEOpenLocationCommand *)openLocation:(id)directParameter {
    return [TEOpenLocationCommand commandWithAppData: self.aebAppData
                       eventClass: 0x4755524c
                          eventID: 0x4755524c
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEPrintCommand *)print {
    return [TEPrintCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x70646f63
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEPrintCommand *)print:(id)directParameter {
    return [TEPrintCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x70646f63
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEQuitCommand *)quit {
    return [TEQuitCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x71756974
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEQuitCommand *)quit:(id)directParameter {
    return [TEQuitCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x71756974
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TEReopenCommand *)reopen {
    return [TEReopenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x72617070
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TEReopenCommand *)reopen:(id)directParameter {
    return [TEReopenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x72617070
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TERunCommand *)run {
    return [TERunCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f617070
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TERunCommand *)run:(id)directParameter {
    return [TERunCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f617070
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TESaveCommand *)save {
    return [TESaveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73617665
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TESaveCommand *)save:(id)directParameter {
    return [TESaveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73617665
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (TESetCommand *)set {
    return [TESetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73657464
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (TESetCommand *)set:(id)directParameter {
    return [TESetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73657464
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
@end




@implementation TEApplication

/* note: clients shouldn't need to call -initWithTargetType:data: themselves */

- (instancetype)initWithTargetType:(AEBTargetType)targetType_ data:(id)targetData_ {
    AEBStaticAppData *data = [[AEBStaticAppData alloc] initWithApplicationClass: AEMApplication.class
                                                                    symbolClass: TESymbol.class
                                                                 specifierClass: TESpecifier.class
                                                                     targetType: targetType_
                                                                     targetData: targetData_];
    self = [super initWithAppData: data aemQuery: AEMApp];

    if (!self) return self;
    return self;
}

/* initialisers */

+ (instancetype)application {
    return [[self alloc] init];
}
+ (instancetype)currentApplication {
    return [[self alloc] initCurrentApplication];
}
+ (instancetype)applicationWithName:(NSString *)name {
    return [[self alloc] initWithName: name];
}
+ (instancetype)applicationWithURL:(NSURL *)url {
    return [[self alloc] initWithURL: url];
}
+ (instancetype)applicationWithBundleID:(NSString *)bundleID {
    return [[self alloc] initWithBundleID: bundleID];
}
+ (instancetype)applicationWithProcessID:(pid_t)pid {
    return [[self alloc] initWithProcessID: pid];
}
+ (instancetype)applicationWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [[self alloc] initWithDescriptor: desc];
}
- (instancetype)init {
    return [self initWithBundleID: @"com.apple.TextEdit"];
}
- (instancetype)initCurrentApplication {
    return [self initWithTargetType: kAEBTargetCurrent data: nil];
}
- (instancetype)initWithName:(NSString *)name {
    return [self initWithTargetType: kAEBTargetName data: name];
}
- (instancetype)initWithURL:(NSURL *)url {
    return [self initWithTargetType: kAEBTargetURL data: url];
}
- (instancetype)initWithBundleID:(NSString *)bundleID {
    return [self initWithTargetType: kAEBTargetBundleID data: bundleID];
}
- (instancetype)initWithProcessID:(pid_t)pid {
    return [self initWithTargetType: kAEBTargetProcessID data: [NSNumber numberWithInteger: pid]];
}
- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [self initWithTargetType: kAEBTargetDescriptor data: desc];
}

/* misc */

- (TESpecifier *)customRoot:(id)object {
    if ([object isKindOfClass: TESpecifier.class]) {
        return [[TESpecifier alloc] initWithAppData: self.aebAppData aemQuery: [object aemQuery]];
    } else if ([object isKindOfClass: AEMQuery.class]) {
        return [[TESpecifier alloc] initWithAppData: self.aebAppData aemQuery: object];
    } else if (!object) {
        return [[TESpecifier alloc] initWithAppData: self.aebAppData aemQuery: AEMApp];
    } else {
        return [[TESpecifier alloc] initWithAppData: self.aebAppData aemQuery: AEMRoot(object)];
    }
}
@end

