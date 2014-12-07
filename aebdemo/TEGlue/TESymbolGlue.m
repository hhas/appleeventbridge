//
// TESymbolGlue.m
// TextEdit
// AppleEventBridge 0.7.0
//

#import "TESymbolGlue.h"

@implementation TESymbol
+ (instancetype)symbolWithCode:(OSType)code_ {
    switch (code_) {
        case 'apr ': return self.April;
        case 'aug ': return self.August;
        case 'cstr': return self.CString;
        case 'dec ': return self.December;
        case 'EPS ': return self.EPSPicture;
        case 'feb ': return self.February;
        case 'fri ': return self.Friday;
        case 'GIFf': return self.GIFPicture;
        case 'JPEG': return self.JPEGPicture;
        case 'jan ': return self.January;
        case 'jul ': return self.July;
        case 'jun ': return self.June;
        case 'mar ': return self.March;
        case 'may ': return self.May;
        case 'mon ': return self.Monday;
        case 'nov ': return self.November;
        case 'oct ': return self.October;
        case 'PICT': return self.PICTPicture;
        case 'pstr': return self.PascalString;
        case 'tr16': return self.RGB16Color;
        case 'tr96': return self.RGB96Color;
        case 'cRGB': return self.RGBColor;
        case 'sat ': return self.Saturday;
        case 'sep ': return self.September;
        case 'sun ': return self.Sunday;
        case 'TIFF': return self.TIFFPicture;
        case 'thu ': return self.Thursday;
        case 'tue ': return self.Tuesday;
        case 'ut16': return self.UTF16Text;
        case 'utf8': return self.UTF8Text;
        case 'utxt': return self.UnicodeText;
        case 'wed ': return self.Wednesday;
        case 'alis': return self.alias;
        case '****': return self.anything;
        case 'capp': return self.application;
        case 'bund': return self.applicationBundleID;
        case 'rmte': return self.applicationResponses;
        case 'sign': return self.applicationSignature;
        case 'aprl': return self.applicationURL;
        case 'ask ': return self.ask;
        case 'atts': return self.attachment;
        case 'catr': return self.attributeRun;
        case 'best': return self.best;
        case 'bool': return self.boolean;
        case 'qdrt': return self.boundingRectangle;
        case 'pbnd': return self.bounds;
        case 'case': return self.case_;
        case 'cmtr': return self.centimeters;
        case 'cha ': return self.character;
        case 'gcli': return self.classInfo;
        case 'pcls': return self.class_;
        case 'hclb': return self.closeable;
        case 'lwcl': return self.collating;
        case 'colr': return self.color;
        case 'clrt': return self.colorTable;
        case 'lwcp': return self.copies;
        case 'ccmt': return self.cubicCentimeters;
        case 'cfet': return self.cubicFeet;
        case 'cuin': return self.cubicInches;
        case 'cmet': return self.cubicMeters;
        case 'cyrd': return self.cubicYards;
        case 'tdas': return self.dashStyle;
        case 'rdat': return self.data;
        case 'ldt ': return self.date;
        case 'decm': return self.decimalStruct;
        case 'degc': return self.degreesCelsius;
        case 'degf': return self.degreesFahrenheit;
        case 'degk': return self.degreesKelvin;
        case 'lwdt': return self.detailed;
        case 'diac': return self.diacriticals;
        case 'docu': return self.document;
        case 'comp': return self.doubleInteger;
        case 'elin': return self.elementInfo;
        case 'encs': return self.encodedString;
        case 'lwlp': return self.endingPage;
        case 'enum': return self.enumerator;
        case 'lweh': return self.errorHandling;
        case 'evin': return self.eventInfo;
        case 'expa': return self.expansion;
        case 'exte': return self.extendedFloat;
        case 'faxn': return self.faxNumber;
        case 'feet': return self.feet;
        case 'atfn': return self.fileName;
        case 'fsrf': return self.fileRef;
        case 'fss ': return self.fileSpecification;
        case 'furl': return self.fileURL;
        case 'fixd': return self.fixed;
        case 'fpnt': return self.fixedPoint;
        case 'frct': return self.fixedRectangle;
        case 'ldbl': return self.float128bit;
        case 'doub': return self.float_;
        case 'isfl': return self.floating;
        case 'font': return self.font;
        case 'pisf': return self.frontmost;
        case 'galn': return self.gallons;
        case 'gram': return self.grams;
        case 'cgtx': return self.graphicText;
        case 'hyph': return self.hyphens;
        case 'ID  ': return self.id_;
        case 'inch': return self.inches;
        case 'pidx': return self.index;
        case 'long': return self.integer;
        case 'itxt': return self.internationalText;
        case 'intl': return self.internationalWritingCode;
        case 'cobj': return self.item;
        case 'kpid': return self.kernelProcessID;
        case 'kgrm': return self.kilograms;
        case 'kmtr': return self.kilometers;
        case 'list': return self.list;
        case 'litr': return self.liters;
        case 'insl': return self.locationReference;
        case 'lfxd': return self.longFixed;
        case 'lfpt': return self.longFixedPoint;
        case 'lfrc': return self.longFixedRectangle;
        case 'lpnt': return self.longPoint;
        case 'lrct': return self.longRectangle;
        case 'port': return self.machPort;
        case 'mach': return self.machine;
        case 'mLoc': return self.machineLocation;
        case 'metr': return self.meters;
        case 'mile': return self.miles;
        case 'ismn': return self.miniaturizable;
        case 'pmnd': return self.miniaturized;
        case 'msng': return self.missingValue;
        case 'pmod': return self.modal;
        case 'imod': return self.modified;
        case 'pnam': return self.name;
        case 'no  ': return self.no;
        case 'null': return self.null;
        case 'nume': return self.numericStrings;
        case 'ozs ': return self.ounces;
        case 'lwla': return self.pagesAcross;
        case 'lwld': return self.pagesDown;
        case 'cpar': return self.paragraph;
        case 'pmin': return self.parameterInfo;
        case 'ppth': return self.path;
        case 'tpmm': return self.pixelMapRecord;
        case 'QDpt': return self.point;
        case 'lbs ': return self.pounds;
        case 'pset': return self.printSettings;
        case 'psn ': return self.processSerialNumber;
        case 'pALL': return self.properties;
        case 'prop': return self.property;
        case 'pinf': return self.propertyInfo;
        case 'punc': return self.punctuation;
        case 'qrts': return self.quarts;
        case 'reco': return self.record;
        case 'obj ': return self.reference;
        case 'lwqt': return self.requestedPrintTime;
        case 'prsz': return self.resizable;
        case 'trot': return self.rotation;
        case 'scpt': return self.script;
        case 'sing': return self.shortFloat;
        case 'shor': return self.shortInteger;
        case 'ptsz': return self.size;
        case 'sqft': return self.squareFeet;
        case 'sqkm': return self.squareKilometers;
        case 'sqrm': return self.squareMeters;
        case 'sqmi': return self.squareMiles;
        case 'sqyd': return self.squareYards;
        case 'lwst': return self.standard;
        case 'lwfp': return self.startingPage;
        case 'TEXT': return self.string;
        case 'styl': return self.styledClipboardText;
        case 'STXT': return self.styledText;
        case 'sutx': return self.styledUnicodeText;
        case 'suin': return self.suiteInfo;
        case 'trpr': return self.targetPrinter;
        case 'ctxt': return self.text;
        case 'tsty': return self.textStyleInfo;
        case 'ptit': return self.titled;
        case 'type': return self.typeClass;
        case 'magn': return self.unsignedInteger;
        case 'vers': return self.version_;
        case 'pvis': return self.visible;
        case 'whit': return self.whitespace;
        case 'cwin': return self.window;
        case 'cwor': return self.word;
        case 'psct': return self.writingCode;
        case 'yard': return self.yards;
        case 'yes ': return self.yes;
        case 'iszm': return self.zoomable;
        case 'pzum': return self.zoomed;
        default: return [super symbolWithCode: code_];
    }
}

/* Enumerators */

+ (instancetype)applicationResponses {
    AEB_RETURN_SYMBOL(@"applicationResponses", typeEnumerated, 'rmte');
}
+ (instancetype)ask {
    AEB_RETURN_SYMBOL(@"ask", typeEnumerated, 'ask ');
}
+ (instancetype)case_ {
    AEB_RETURN_SYMBOL(@"case_", typeEnumerated, 'case');
}
+ (instancetype)detailed {
    AEB_RETURN_SYMBOL(@"detailed", typeEnumerated, 'lwdt');
}
+ (instancetype)diacriticals {
    AEB_RETURN_SYMBOL(@"diacriticals", typeEnumerated, 'diac');
}
+ (instancetype)expansion {
    AEB_RETURN_SYMBOL(@"expansion", typeEnumerated, 'expa');
}
+ (instancetype)hyphens {
    AEB_RETURN_SYMBOL(@"hyphens", typeEnumerated, 'hyph');
}
+ (instancetype)no {
    AEB_RETURN_SYMBOL(@"no", typeEnumerated, 'no  ');
}
+ (instancetype)numericStrings {
    AEB_RETURN_SYMBOL(@"numericStrings", typeEnumerated, 'nume');
}
+ (instancetype)punctuation {
    AEB_RETURN_SYMBOL(@"punctuation", typeEnumerated, 'punc');
}
+ (instancetype)standard {
    AEB_RETURN_SYMBOL(@"standard", typeEnumerated, 'lwst');
}
+ (instancetype)whitespace {
    AEB_RETURN_SYMBOL(@"whitespace", typeEnumerated, 'whit');
}
+ (instancetype)yes {
    AEB_RETURN_SYMBOL(@"yes", typeEnumerated, 'yes ');
}

/* Types and properties */

+ (instancetype)April {
    AEB_RETURN_SYMBOL(@"April", typeType, 'apr ');
}
+ (instancetype)August {
    AEB_RETURN_SYMBOL(@"August", typeType, 'aug ');
}
+ (instancetype)CString {
    AEB_RETURN_SYMBOL(@"CString", typeType, 'cstr');
}
+ (instancetype)December {
    AEB_RETURN_SYMBOL(@"December", typeType, 'dec ');
}
+ (instancetype)EPSPicture {
    AEB_RETURN_SYMBOL(@"EPSPicture", typeType, 'EPS ');
}
+ (instancetype)February {
    AEB_RETURN_SYMBOL(@"February", typeType, 'feb ');
}
+ (instancetype)Friday {
    AEB_RETURN_SYMBOL(@"Friday", typeType, 'fri ');
}
+ (instancetype)GIFPicture {
    AEB_RETURN_SYMBOL(@"GIFPicture", typeType, 'GIFf');
}
+ (instancetype)JPEGPicture {
    AEB_RETURN_SYMBOL(@"JPEGPicture", typeType, 'JPEG');
}
+ (instancetype)January {
    AEB_RETURN_SYMBOL(@"January", typeType, 'jan ');
}
+ (instancetype)July {
    AEB_RETURN_SYMBOL(@"July", typeType, 'jul ');
}
+ (instancetype)June {
    AEB_RETURN_SYMBOL(@"June", typeType, 'jun ');
}
+ (instancetype)March {
    AEB_RETURN_SYMBOL(@"March", typeType, 'mar ');
}
+ (instancetype)May {
    AEB_RETURN_SYMBOL(@"May", typeType, 'may ');
}
+ (instancetype)Monday {
    AEB_RETURN_SYMBOL(@"Monday", typeType, 'mon ');
}
+ (instancetype)November {
    AEB_RETURN_SYMBOL(@"November", typeType, 'nov ');
}
+ (instancetype)October {
    AEB_RETURN_SYMBOL(@"October", typeType, 'oct ');
}
+ (instancetype)PICTPicture {
    AEB_RETURN_SYMBOL(@"PICTPicture", typeType, 'PICT');
}
+ (instancetype)PascalString {
    AEB_RETURN_SYMBOL(@"PascalString", typeType, 'pstr');
}
+ (instancetype)RGB16Color {
    AEB_RETURN_SYMBOL(@"RGB16Color", typeType, 'tr16');
}
+ (instancetype)RGB96Color {
    AEB_RETURN_SYMBOL(@"RGB96Color", typeType, 'tr96');
}
+ (instancetype)RGBColor {
    AEB_RETURN_SYMBOL(@"RGBColor", typeType, 'cRGB');
}
+ (instancetype)Saturday {
    AEB_RETURN_SYMBOL(@"Saturday", typeType, 'sat ');
}
+ (instancetype)September {
    AEB_RETURN_SYMBOL(@"September", typeType, 'sep ');
}
+ (instancetype)Sunday {
    AEB_RETURN_SYMBOL(@"Sunday", typeType, 'sun ');
}
+ (instancetype)TIFFPicture {
    AEB_RETURN_SYMBOL(@"TIFFPicture", typeType, 'TIFF');
}
+ (instancetype)Thursday {
    AEB_RETURN_SYMBOL(@"Thursday", typeType, 'thu ');
}
+ (instancetype)Tuesday {
    AEB_RETURN_SYMBOL(@"Tuesday", typeType, 'tue ');
}
+ (instancetype)UTF16Text {
    AEB_RETURN_SYMBOL(@"UTF16Text", typeType, 'ut16');
}
+ (instancetype)UTF8Text {
    AEB_RETURN_SYMBOL(@"UTF8Text", typeType, 'utf8');
}
+ (instancetype)UnicodeText {
    AEB_RETURN_SYMBOL(@"UnicodeText", typeType, 'utxt');
}
+ (instancetype)Wednesday {
    AEB_RETURN_SYMBOL(@"Wednesday", typeType, 'wed ');
}
+ (instancetype)alias {
    AEB_RETURN_SYMBOL(@"alias", typeType, 'alis');
}
+ (instancetype)anything {
    AEB_RETURN_SYMBOL(@"anything", typeType, '****');
}
+ (instancetype)application {
    AEB_RETURN_SYMBOL(@"application", typeType, 'capp');
}
+ (instancetype)applicationBundleID {
    AEB_RETURN_SYMBOL(@"applicationBundleID", typeType, 'bund');
}
+ (instancetype)applicationSignature {
    AEB_RETURN_SYMBOL(@"applicationSignature", typeType, 'sign');
}
+ (instancetype)applicationURL {
    AEB_RETURN_SYMBOL(@"applicationURL", typeType, 'aprl');
}
+ (instancetype)attachment {
    AEB_RETURN_SYMBOL(@"attachment", typeType, 'atts');
}
+ (instancetype)attributeRun {
    AEB_RETURN_SYMBOL(@"attributeRun", typeType, 'catr');
}
+ (instancetype)best {
    AEB_RETURN_SYMBOL(@"best", typeType, 'best');
}
+ (instancetype)boolean {
    AEB_RETURN_SYMBOL(@"boolean", typeType, 'bool');
}
+ (instancetype)boundingRectangle {
    AEB_RETURN_SYMBOL(@"boundingRectangle", typeType, 'qdrt');
}
+ (instancetype)bounds {
    AEB_RETURN_SYMBOL(@"bounds", typeType, 'pbnd');
}
+ (instancetype)centimeters {
    AEB_RETURN_SYMBOL(@"centimeters", typeType, 'cmtr');
}
+ (instancetype)character {
    AEB_RETURN_SYMBOL(@"character", typeType, 'cha ');
}
+ (instancetype)classInfo {
    AEB_RETURN_SYMBOL(@"classInfo", typeType, 'gcli');
}
+ (instancetype)class_ {
    AEB_RETURN_SYMBOL(@"class_", typeType, 'pcls');
}
+ (instancetype)closeable {
    AEB_RETURN_SYMBOL(@"closeable", typeType, 'hclb');
}
+ (instancetype)collating {
    AEB_RETURN_SYMBOL(@"collating", typeType, 'lwcl');
}
+ (instancetype)color {
    AEB_RETURN_SYMBOL(@"color", typeType, 'colr');
}
+ (instancetype)colorTable {
    AEB_RETURN_SYMBOL(@"colorTable", typeType, 'clrt');
}
+ (instancetype)copies {
    AEB_RETURN_SYMBOL(@"copies", typeType, 'lwcp');
}
+ (instancetype)cubicCentimeters {
    AEB_RETURN_SYMBOL(@"cubicCentimeters", typeType, 'ccmt');
}
+ (instancetype)cubicFeet {
    AEB_RETURN_SYMBOL(@"cubicFeet", typeType, 'cfet');
}
+ (instancetype)cubicInches {
    AEB_RETURN_SYMBOL(@"cubicInches", typeType, 'cuin');
}
+ (instancetype)cubicMeters {
    AEB_RETURN_SYMBOL(@"cubicMeters", typeType, 'cmet');
}
+ (instancetype)cubicYards {
    AEB_RETURN_SYMBOL(@"cubicYards", typeType, 'cyrd');
}
+ (instancetype)dashStyle {
    AEB_RETURN_SYMBOL(@"dashStyle", typeType, 'tdas');
}
+ (instancetype)data {
    AEB_RETURN_SYMBOL(@"data", typeType, 'rdat');
}
+ (instancetype)date {
    AEB_RETURN_SYMBOL(@"date", typeType, 'ldt ');
}
+ (instancetype)decimalStruct {
    AEB_RETURN_SYMBOL(@"decimalStruct", typeType, 'decm');
}
+ (instancetype)degreesCelsius {
    AEB_RETURN_SYMBOL(@"degreesCelsius", typeType, 'degc');
}
+ (instancetype)degreesFahrenheit {
    AEB_RETURN_SYMBOL(@"degreesFahrenheit", typeType, 'degf');
}
+ (instancetype)degreesKelvin {
    AEB_RETURN_SYMBOL(@"degreesKelvin", typeType, 'degk');
}
+ (instancetype)document {
    AEB_RETURN_SYMBOL(@"document", typeType, 'docu');
}
+ (instancetype)doubleInteger {
    AEB_RETURN_SYMBOL(@"doubleInteger", typeType, 'comp');
}
+ (instancetype)elementInfo {
    AEB_RETURN_SYMBOL(@"elementInfo", typeType, 'elin');
}
+ (instancetype)encodedString {
    AEB_RETURN_SYMBOL(@"encodedString", typeType, 'encs');
}
+ (instancetype)endingPage {
    AEB_RETURN_SYMBOL(@"endingPage", typeType, 'lwlp');
}
+ (instancetype)enumerator {
    AEB_RETURN_SYMBOL(@"enumerator", typeType, 'enum');
}
+ (instancetype)errorHandling {
    AEB_RETURN_SYMBOL(@"errorHandling", typeType, 'lweh');
}
+ (instancetype)eventInfo {
    AEB_RETURN_SYMBOL(@"eventInfo", typeType, 'evin');
}
+ (instancetype)extendedFloat {
    AEB_RETURN_SYMBOL(@"extendedFloat", typeType, 'exte');
}
+ (instancetype)faxNumber {
    AEB_RETURN_SYMBOL(@"faxNumber", typeType, 'faxn');
}
+ (instancetype)feet {
    AEB_RETURN_SYMBOL(@"feet", typeType, 'feet');
}
+ (instancetype)fileName {
    AEB_RETURN_SYMBOL(@"fileName", typeType, 'atfn');
}
+ (instancetype)fileRef {
    AEB_RETURN_SYMBOL(@"fileRef", typeType, 'fsrf');
}
+ (instancetype)fileSpecification {
    AEB_RETURN_SYMBOL(@"fileSpecification", typeType, 'fss ');
}
+ (instancetype)fileURL {
    AEB_RETURN_SYMBOL(@"fileURL", typeType, 'furl');
}
+ (instancetype)fixed {
    AEB_RETURN_SYMBOL(@"fixed", typeType, 'fixd');
}
+ (instancetype)fixedPoint {
    AEB_RETURN_SYMBOL(@"fixedPoint", typeType, 'fpnt');
}
+ (instancetype)fixedRectangle {
    AEB_RETURN_SYMBOL(@"fixedRectangle", typeType, 'frct');
}
+ (instancetype)float128bit {
    AEB_RETURN_SYMBOL(@"float128bit", typeType, 'ldbl');
}
+ (instancetype)float_ {
    AEB_RETURN_SYMBOL(@"float_", typeType, 'doub');
}
+ (instancetype)floating {
    AEB_RETURN_SYMBOL(@"floating", typeType, 'isfl');
}
+ (instancetype)font {
    AEB_RETURN_SYMBOL(@"font", typeType, 'font');
}
+ (instancetype)frontmost {
    AEB_RETURN_SYMBOL(@"frontmost", typeType, 'pisf');
}
+ (instancetype)gallons {
    AEB_RETURN_SYMBOL(@"gallons", typeType, 'galn');
}
+ (instancetype)grams {
    AEB_RETURN_SYMBOL(@"grams", typeType, 'gram');
}
+ (instancetype)graphicText {
    AEB_RETURN_SYMBOL(@"graphicText", typeType, 'cgtx');
}
+ (instancetype)id_ {
    AEB_RETURN_SYMBOL(@"id_", typeType, 'ID  ');
}
+ (instancetype)inches {
    AEB_RETURN_SYMBOL(@"inches", typeType, 'inch');
}
+ (instancetype)index {
    AEB_RETURN_SYMBOL(@"index", typeType, 'pidx');
}
+ (instancetype)integer {
    AEB_RETURN_SYMBOL(@"integer", typeType, 'long');
}
+ (instancetype)internationalText {
    AEB_RETURN_SYMBOL(@"internationalText", typeType, 'itxt');
}
+ (instancetype)internationalWritingCode {
    AEB_RETURN_SYMBOL(@"internationalWritingCode", typeType, 'intl');
}
+ (instancetype)item {
    AEB_RETURN_SYMBOL(@"item", typeType, 'cobj');
}
+ (instancetype)kernelProcessID {
    AEB_RETURN_SYMBOL(@"kernelProcessID", typeType, 'kpid');
}
+ (instancetype)kilograms {
    AEB_RETURN_SYMBOL(@"kilograms", typeType, 'kgrm');
}
+ (instancetype)kilometers {
    AEB_RETURN_SYMBOL(@"kilometers", typeType, 'kmtr');
}
+ (instancetype)list {
    AEB_RETURN_SYMBOL(@"list", typeType, 'list');
}
+ (instancetype)liters {
    AEB_RETURN_SYMBOL(@"liters", typeType, 'litr');
}
+ (instancetype)locationReference {
    AEB_RETURN_SYMBOL(@"locationReference", typeType, 'insl');
}
+ (instancetype)longFixed {
    AEB_RETURN_SYMBOL(@"longFixed", typeType, 'lfxd');
}
+ (instancetype)longFixedPoint {
    AEB_RETURN_SYMBOL(@"longFixedPoint", typeType, 'lfpt');
}
+ (instancetype)longFixedRectangle {
    AEB_RETURN_SYMBOL(@"longFixedRectangle", typeType, 'lfrc');
}
+ (instancetype)longPoint {
    AEB_RETURN_SYMBOL(@"longPoint", typeType, 'lpnt');
}
+ (instancetype)longRectangle {
    AEB_RETURN_SYMBOL(@"longRectangle", typeType, 'lrct');
}
+ (instancetype)machPort {
    AEB_RETURN_SYMBOL(@"machPort", typeType, 'port');
}
+ (instancetype)machine {
    AEB_RETURN_SYMBOL(@"machine", typeType, 'mach');
}
+ (instancetype)machineLocation {
    AEB_RETURN_SYMBOL(@"machineLocation", typeType, 'mLoc');
}
+ (instancetype)meters {
    AEB_RETURN_SYMBOL(@"meters", typeType, 'metr');
}
+ (instancetype)miles {
    AEB_RETURN_SYMBOL(@"miles", typeType, 'mile');
}
+ (instancetype)miniaturizable {
    AEB_RETURN_SYMBOL(@"miniaturizable", typeType, 'ismn');
}
+ (instancetype)miniaturized {
    AEB_RETURN_SYMBOL(@"miniaturized", typeType, 'pmnd');
}
+ (instancetype)missingValue {
    AEB_RETURN_SYMBOL(@"missingValue", typeType, 'msng');
}
+ (instancetype)modal {
    AEB_RETURN_SYMBOL(@"modal", typeType, 'pmod');
}
+ (instancetype)modified {
    AEB_RETURN_SYMBOL(@"modified", typeType, 'imod');
}
+ (instancetype)name {
    AEB_RETURN_SYMBOL(@"name", typeType, 'pnam');
}
+ (instancetype)null {
    AEB_RETURN_SYMBOL(@"null", typeType, 'null');
}
+ (instancetype)ounces {
    AEB_RETURN_SYMBOL(@"ounces", typeType, 'ozs ');
}
+ (instancetype)pagesAcross {
    AEB_RETURN_SYMBOL(@"pagesAcross", typeType, 'lwla');
}
+ (instancetype)pagesDown {
    AEB_RETURN_SYMBOL(@"pagesDown", typeType, 'lwld');
}
+ (instancetype)paragraph {
    AEB_RETURN_SYMBOL(@"paragraph", typeType, 'cpar');
}
+ (instancetype)parameterInfo {
    AEB_RETURN_SYMBOL(@"parameterInfo", typeType, 'pmin');
}
+ (instancetype)path {
    AEB_RETURN_SYMBOL(@"path", typeType, 'ppth');
}
+ (instancetype)pixelMapRecord {
    AEB_RETURN_SYMBOL(@"pixelMapRecord", typeType, 'tpmm');
}
+ (instancetype)point {
    AEB_RETURN_SYMBOL(@"point", typeType, 'QDpt');
}
+ (instancetype)pounds {
    AEB_RETURN_SYMBOL(@"pounds", typeType, 'lbs ');
}
+ (instancetype)printSettings {
    AEB_RETURN_SYMBOL(@"printSettings", typeType, 'pset');
}
+ (instancetype)processSerialNumber {
    AEB_RETURN_SYMBOL(@"processSerialNumber", typeType, 'psn ');
}
+ (instancetype)properties {
    AEB_RETURN_SYMBOL(@"properties", typeType, 'pALL');
}
+ (instancetype)property {
    AEB_RETURN_SYMBOL(@"property", typeType, 'prop');
}
+ (instancetype)propertyInfo {
    AEB_RETURN_SYMBOL(@"propertyInfo", typeType, 'pinf');
}
+ (instancetype)quarts {
    AEB_RETURN_SYMBOL(@"quarts", typeType, 'qrts');
}
+ (instancetype)record {
    AEB_RETURN_SYMBOL(@"record", typeType, 'reco');
}
+ (instancetype)reference {
    AEB_RETURN_SYMBOL(@"reference", typeType, 'obj ');
}
+ (instancetype)requestedPrintTime {
    AEB_RETURN_SYMBOL(@"requestedPrintTime", typeType, 'lwqt');
}
+ (instancetype)resizable {
    AEB_RETURN_SYMBOL(@"resizable", typeType, 'prsz');
}
+ (instancetype)rotation {
    AEB_RETURN_SYMBOL(@"rotation", typeType, 'trot');
}
+ (instancetype)script {
    AEB_RETURN_SYMBOL(@"script", typeType, 'scpt');
}
+ (instancetype)shortFloat {
    AEB_RETURN_SYMBOL(@"shortFloat", typeType, 'sing');
}
+ (instancetype)shortInteger {
    AEB_RETURN_SYMBOL(@"shortInteger", typeType, 'shor');
}
+ (instancetype)size {
    AEB_RETURN_SYMBOL(@"size", typeType, 'ptsz');
}
+ (instancetype)squareFeet {
    AEB_RETURN_SYMBOL(@"squareFeet", typeType, 'sqft');
}
+ (instancetype)squareKilometers {
    AEB_RETURN_SYMBOL(@"squareKilometers", typeType, 'sqkm');
}
+ (instancetype)squareMeters {
    AEB_RETURN_SYMBOL(@"squareMeters", typeType, 'sqrm');
}
+ (instancetype)squareMiles {
    AEB_RETURN_SYMBOL(@"squareMiles", typeType, 'sqmi');
}
+ (instancetype)squareYards {
    AEB_RETURN_SYMBOL(@"squareYards", typeType, 'sqyd');
}
+ (instancetype)startingPage {
    AEB_RETURN_SYMBOL(@"startingPage", typeType, 'lwfp');
}
+ (instancetype)string {
    AEB_RETURN_SYMBOL(@"string", typeType, 'TEXT');
}
+ (instancetype)styledClipboardText {
    AEB_RETURN_SYMBOL(@"styledClipboardText", typeType, 'styl');
}
+ (instancetype)styledText {
    AEB_RETURN_SYMBOL(@"styledText", typeType, 'STXT');
}
+ (instancetype)styledUnicodeText {
    AEB_RETURN_SYMBOL(@"styledUnicodeText", typeType, 'sutx');
}
+ (instancetype)suiteInfo {
    AEB_RETURN_SYMBOL(@"suiteInfo", typeType, 'suin');
}
+ (instancetype)targetPrinter {
    AEB_RETURN_SYMBOL(@"targetPrinter", typeType, 'trpr');
}
+ (instancetype)text {
    AEB_RETURN_SYMBOL(@"text", typeType, 'ctxt');
}
+ (instancetype)textStyleInfo {
    AEB_RETURN_SYMBOL(@"textStyleInfo", typeType, 'tsty');
}
+ (instancetype)titled {
    AEB_RETURN_SYMBOL(@"titled", typeType, 'ptit');
}
+ (instancetype)typeClass {
    AEB_RETURN_SYMBOL(@"typeClass", typeType, 'type');
}
+ (instancetype)unsignedInteger {
    AEB_RETURN_SYMBOL(@"unsignedInteger", typeType, 'magn');
}
+ (instancetype)version_ {
    AEB_RETURN_SYMBOL(@"version_", typeType, 'vers');
}
+ (instancetype)visible {
    AEB_RETURN_SYMBOL(@"visible", typeType, 'pvis');
}
+ (instancetype)window {
    AEB_RETURN_SYMBOL(@"window", typeType, 'cwin');
}
+ (instancetype)word {
    AEB_RETURN_SYMBOL(@"word", typeType, 'cwor');
}
+ (instancetype)writingCode {
    AEB_RETURN_SYMBOL(@"writingCode", typeType, 'psct');
}
+ (instancetype)yards {
    AEB_RETURN_SYMBOL(@"yards", typeType, 'yard');
}
+ (instancetype)zoomable {
    AEB_RETURN_SYMBOL(@"zoomable", typeType, 'iszm');
}
+ (instancetype)zoomed {
    AEB_RETURN_SYMBOL(@"zoomed", typeType, 'pzum');
}
@end

