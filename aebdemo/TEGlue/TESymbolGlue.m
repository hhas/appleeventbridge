//
// TESymbolGlue.m
// TextEdit
// (AppleEventBridge 1.0)
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
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"applicationResponses" type: typeEnumerated code: 'rmte']);
}
+ (instancetype)ask {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"ask" type: typeEnumerated code: 'ask ']);
}
+ (instancetype)case_ {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"case_" type: typeEnumerated code: 'case']);
}
+ (instancetype)detailed {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"detailed" type: typeEnumerated code: 'lwdt']);
}
+ (instancetype)diacriticals {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"diacriticals" type: typeEnumerated code: 'diac']);
}
+ (instancetype)expansion {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"expansion" type: typeEnumerated code: 'expa']);
}
+ (instancetype)hyphens {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"hyphens" type: typeEnumerated code: 'hyph']);
}
+ (instancetype)no {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"no" type: typeEnumerated code: 'no  ']);
}
+ (instancetype)numericStrings {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"numericStrings" type: typeEnumerated code: 'nume']);
}
+ (instancetype)punctuation {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"punctuation" type: typeEnumerated code: 'punc']);
}
+ (instancetype)standard {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"standard" type: typeEnumerated code: 'lwst']);
}
+ (instancetype)whitespace {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"whitespace" type: typeEnumerated code: 'whit']);
}
+ (instancetype)yes {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"yes" type: typeEnumerated code: 'yes ']);
}

/* Types and properties */

+ (instancetype)April {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"April" type: typeType code: 'apr ']);
}
+ (instancetype)August {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"August" type: typeType code: 'aug ']);
}
+ (instancetype)CString {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"CString" type: typeType code: 'cstr']);
}
+ (instancetype)December {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"December" type: typeType code: 'dec ']);
}
+ (instancetype)EPSPicture {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"EPSPicture" type: typeType code: 'EPS ']);
}
+ (instancetype)February {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"February" type: typeType code: 'feb ']);
}
+ (instancetype)Friday {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"Friday" type: typeType code: 'fri ']);
}
+ (instancetype)GIFPicture {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"GIFPicture" type: typeType code: 'GIFf']);
}
+ (instancetype)JPEGPicture {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"JPEGPicture" type: typeType code: 'JPEG']);
}
+ (instancetype)January {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"January" type: typeType code: 'jan ']);
}
+ (instancetype)July {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"July" type: typeType code: 'jul ']);
}
+ (instancetype)June {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"June" type: typeType code: 'jun ']);
}
+ (instancetype)March {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"March" type: typeType code: 'mar ']);
}
+ (instancetype)May {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"May" type: typeType code: 'may ']);
}
+ (instancetype)Monday {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"Monday" type: typeType code: 'mon ']);
}
+ (instancetype)November {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"November" type: typeType code: 'nov ']);
}
+ (instancetype)October {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"October" type: typeType code: 'oct ']);
}
+ (instancetype)PICTPicture {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"PICTPicture" type: typeType code: 'PICT']);
}
+ (instancetype)PascalString {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"PascalString" type: typeType code: 'pstr']);
}
+ (instancetype)RGB16Color {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"RGB16Color" type: typeType code: 'tr16']);
}
+ (instancetype)RGB96Color {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"RGB96Color" type: typeType code: 'tr96']);
}
+ (instancetype)RGBColor {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"RGBColor" type: typeType code: 'cRGB']);
}
+ (instancetype)Saturday {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"Saturday" type: typeType code: 'sat ']);
}
+ (instancetype)September {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"September" type: typeType code: 'sep ']);
}
+ (instancetype)Sunday {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"Sunday" type: typeType code: 'sun ']);
}
+ (instancetype)TIFFPicture {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"TIFFPicture" type: typeType code: 'TIFF']);
}
+ (instancetype)Thursday {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"Thursday" type: typeType code: 'thu ']);
}
+ (instancetype)Tuesday {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"Tuesday" type: typeType code: 'tue ']);
}
+ (instancetype)UTF16Text {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"UTF16Text" type: typeType code: 'ut16']);
}
+ (instancetype)UTF8Text {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"UTF8Text" type: typeType code: 'utf8']);
}
+ (instancetype)UnicodeText {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"UnicodeText" type: typeType code: 'utxt']);
}
+ (instancetype)Wednesday {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"Wednesday" type: typeType code: 'wed ']);
}
+ (instancetype)alias {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"alias" type: typeType code: 'alis']);
}
+ (instancetype)anything {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"anything" type: typeType code: '****']);
}
+ (instancetype)application {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"application" type: typeType code: 'capp']);
}
+ (instancetype)applicationBundleID {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"applicationBundleID" type: typeType code: 'bund']);
}
+ (instancetype)applicationSignature {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"applicationSignature" type: typeType code: 'sign']);
}
+ (instancetype)applicationURL {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"applicationURL" type: typeType code: 'aprl']);
}
+ (instancetype)attachment {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"attachment" type: typeType code: 'atts']);
}
+ (instancetype)attributeRun {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"attributeRun" type: typeType code: 'catr']);
}
+ (instancetype)best {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"best" type: typeType code: 'best']);
}
+ (instancetype)boolean {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"boolean" type: typeType code: 'bool']);
}
+ (instancetype)boundingRectangle {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"boundingRectangle" type: typeType code: 'qdrt']);
}
+ (instancetype)bounds {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"bounds" type: typeType code: 'pbnd']);
}
+ (instancetype)centimeters {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"centimeters" type: typeType code: 'cmtr']);
}
+ (instancetype)character {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"character" type: typeType code: 'cha ']);
}
+ (instancetype)classInfo {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"classInfo" type: typeType code: 'gcli']);
}
+ (instancetype)class_ {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"class_" type: typeType code: 'pcls']);
}
+ (instancetype)closeable {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"closeable" type: typeType code: 'hclb']);
}
+ (instancetype)collating {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"collating" type: typeType code: 'lwcl']);
}
+ (instancetype)color {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"color" type: typeType code: 'colr']);
}
+ (instancetype)colorTable {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"colorTable" type: typeType code: 'clrt']);
}
+ (instancetype)copies {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"copies" type: typeType code: 'lwcp']);
}
+ (instancetype)cubicCentimeters {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"cubicCentimeters" type: typeType code: 'ccmt']);
}
+ (instancetype)cubicFeet {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"cubicFeet" type: typeType code: 'cfet']);
}
+ (instancetype)cubicInches {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"cubicInches" type: typeType code: 'cuin']);
}
+ (instancetype)cubicMeters {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"cubicMeters" type: typeType code: 'cmet']);
}
+ (instancetype)cubicYards {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"cubicYards" type: typeType code: 'cyrd']);
}
+ (instancetype)dashStyle {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"dashStyle" type: typeType code: 'tdas']);
}
+ (instancetype)data {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"data" type: typeType code: 'rdat']);
}
+ (instancetype)date {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"date" type: typeType code: 'ldt ']);
}
+ (instancetype)decimalStruct {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"decimalStruct" type: typeType code: 'decm']);
}
+ (instancetype)degreesCelsius {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"degreesCelsius" type: typeType code: 'degc']);
}
+ (instancetype)degreesFahrenheit {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"degreesFahrenheit" type: typeType code: 'degf']);
}
+ (instancetype)degreesKelvin {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"degreesKelvin" type: typeType code: 'degk']);
}
+ (instancetype)document {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"document" type: typeType code: 'docu']);
}
+ (instancetype)doubleInteger {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"doubleInteger" type: typeType code: 'comp']);
}
+ (instancetype)elementInfo {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"elementInfo" type: typeType code: 'elin']);
}
+ (instancetype)encodedString {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"encodedString" type: typeType code: 'encs']);
}
+ (instancetype)endingPage {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"endingPage" type: typeType code: 'lwlp']);
}
+ (instancetype)enumerator {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"enumerator" type: typeType code: 'enum']);
}
+ (instancetype)errorHandling {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"errorHandling" type: typeType code: 'lweh']);
}
+ (instancetype)eventInfo {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"eventInfo" type: typeType code: 'evin']);
}
+ (instancetype)extendedFloat {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"extendedFloat" type: typeType code: 'exte']);
}
+ (instancetype)faxNumber {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"faxNumber" type: typeType code: 'faxn']);
}
+ (instancetype)feet {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"feet" type: typeType code: 'feet']);
}
+ (instancetype)fileName {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"fileName" type: typeType code: 'atfn']);
}
+ (instancetype)fileRef {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"fileRef" type: typeType code: 'fsrf']);
}
+ (instancetype)fileSpecification {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"fileSpecification" type: typeType code: 'fss ']);
}
+ (instancetype)fileURL {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"fileURL" type: typeType code: 'furl']);
}
+ (instancetype)fixed {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"fixed" type: typeType code: 'fixd']);
}
+ (instancetype)fixedPoint {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"fixedPoint" type: typeType code: 'fpnt']);
}
+ (instancetype)fixedRectangle {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"fixedRectangle" type: typeType code: 'frct']);
}
+ (instancetype)float128bit {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"float128bit" type: typeType code: 'ldbl']);
}
+ (instancetype)float_ {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"float_" type: typeType code: 'doub']);
}
+ (instancetype)floating {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"floating" type: typeType code: 'isfl']);
}
+ (instancetype)font {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"font" type: typeType code: 'font']);
}
+ (instancetype)frontmost {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"frontmost" type: typeType code: 'pisf']);
}
+ (instancetype)gallons {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"gallons" type: typeType code: 'galn']);
}
+ (instancetype)grams {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"grams" type: typeType code: 'gram']);
}
+ (instancetype)graphicText {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"graphicText" type: typeType code: 'cgtx']);
}
+ (instancetype)id_ {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"id_" type: typeType code: 'ID  ']);
}
+ (instancetype)inches {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"inches" type: typeType code: 'inch']);
}
+ (instancetype)index {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"index" type: typeType code: 'pidx']);
}
+ (instancetype)integer {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"integer" type: typeType code: 'long']);
}
+ (instancetype)internationalText {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"internationalText" type: typeType code: 'itxt']);
}
+ (instancetype)internationalWritingCode {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"internationalWritingCode" type: typeType code: 'intl']);
}
+ (instancetype)item {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"item" type: typeType code: 'cobj']);
}
+ (instancetype)kernelProcessID {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"kernelProcessID" type: typeType code: 'kpid']);
}
+ (instancetype)kilograms {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"kilograms" type: typeType code: 'kgrm']);
}
+ (instancetype)kilometers {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"kilometers" type: typeType code: 'kmtr']);
}
+ (instancetype)list {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"list" type: typeType code: 'list']);
}
+ (instancetype)liters {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"liters" type: typeType code: 'litr']);
}
+ (instancetype)locationReference {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"locationReference" type: typeType code: 'insl']);
}
+ (instancetype)longFixed {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"longFixed" type: typeType code: 'lfxd']);
}
+ (instancetype)longFixedPoint {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"longFixedPoint" type: typeType code: 'lfpt']);
}
+ (instancetype)longFixedRectangle {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"longFixedRectangle" type: typeType code: 'lfrc']);
}
+ (instancetype)longPoint {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"longPoint" type: typeType code: 'lpnt']);
}
+ (instancetype)longRectangle {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"longRectangle" type: typeType code: 'lrct']);
}
+ (instancetype)machPort {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"machPort" type: typeType code: 'port']);
}
+ (instancetype)machine {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"machine" type: typeType code: 'mach']);
}
+ (instancetype)machineLocation {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"machineLocation" type: typeType code: 'mLoc']);
}
+ (instancetype)meters {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"meters" type: typeType code: 'metr']);
}
+ (instancetype)miles {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"miles" type: typeType code: 'mile']);
}
+ (instancetype)miniaturizable {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"miniaturizable" type: typeType code: 'ismn']);
}
+ (instancetype)miniaturized {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"miniaturized" type: typeType code: 'pmnd']);
}
+ (instancetype)missingValue {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"missingValue" type: typeType code: 'msng']);
}
+ (instancetype)modal {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"modal" type: typeType code: 'pmod']);
}
+ (instancetype)modified {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"modified" type: typeType code: 'imod']);
}
+ (instancetype)name {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"name" type: typeType code: 'pnam']);
}
+ (instancetype)null {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"null" type: typeType code: 'null']);
}
+ (instancetype)ounces {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"ounces" type: typeType code: 'ozs ']);
}
+ (instancetype)pagesAcross {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"pagesAcross" type: typeType code: 'lwla']);
}
+ (instancetype)pagesDown {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"pagesDown" type: typeType code: 'lwld']);
}
+ (instancetype)paragraph {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"paragraph" type: typeType code: 'cpar']);
}
+ (instancetype)parameterInfo {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"parameterInfo" type: typeType code: 'pmin']);
}
+ (instancetype)path {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"path" type: typeType code: 'ppth']);
}
+ (instancetype)pixelMapRecord {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"pixelMapRecord" type: typeType code: 'tpmm']);
}
+ (instancetype)point {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"point" type: typeType code: 'QDpt']);
}
+ (instancetype)pounds {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"pounds" type: typeType code: 'lbs ']);
}
+ (instancetype)printSettings {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"printSettings" type: typeType code: 'pset']);
}
+ (instancetype)processSerialNumber {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"processSerialNumber" type: typeType code: 'psn ']);
}
+ (instancetype)properties {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"properties" type: typeType code: 'pALL']);
}
+ (instancetype)property {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"property" type: typeType code: 'prop']);
}
+ (instancetype)propertyInfo {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"propertyInfo" type: typeType code: 'pinf']);
}
+ (instancetype)quarts {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"quarts" type: typeType code: 'qrts']);
}
+ (instancetype)record {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"record" type: typeType code: 'reco']);
}
+ (instancetype)reference {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"reference" type: typeType code: 'obj ']);
}
+ (instancetype)requestedPrintTime {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"requestedPrintTime" type: typeType code: 'lwqt']);
}
+ (instancetype)resizable {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"resizable" type: typeType code: 'prsz']);
}
+ (instancetype)rotation {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"rotation" type: typeType code: 'trot']);
}
+ (instancetype)script {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"script" type: typeType code: 'scpt']);
}
+ (instancetype)shortFloat {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"shortFloat" type: typeType code: 'sing']);
}
+ (instancetype)shortInteger {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"shortInteger" type: typeType code: 'shor']);
}
+ (instancetype)size {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"size" type: typeType code: 'ptsz']);
}
+ (instancetype)squareFeet {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"squareFeet" type: typeType code: 'sqft']);
}
+ (instancetype)squareKilometers {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"squareKilometers" type: typeType code: 'sqkm']);
}
+ (instancetype)squareMeters {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"squareMeters" type: typeType code: 'sqrm']);
}
+ (instancetype)squareMiles {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"squareMiles" type: typeType code: 'sqmi']);
}
+ (instancetype)squareYards {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"squareYards" type: typeType code: 'sqyd']);
}
+ (instancetype)startingPage {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"startingPage" type: typeType code: 'lwfp']);
}
+ (instancetype)string {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"string" type: typeType code: 'TEXT']);
}
+ (instancetype)styledClipboardText {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"styledClipboardText" type: typeType code: 'styl']);
}
+ (instancetype)styledText {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"styledText" type: typeType code: 'STXT']);
}
+ (instancetype)styledUnicodeText {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"styledUnicodeText" type: typeType code: 'sutx']);
}
+ (instancetype)suiteInfo {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"suiteInfo" type: typeType code: 'suin']);
}
+ (instancetype)targetPrinter {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"targetPrinter" type: typeType code: 'trpr']);
}
+ (instancetype)text {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"text" type: typeType code: 'ctxt']);
}
+ (instancetype)textStyleInfo {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"textStyleInfo" type: typeType code: 'tsty']);
}
+ (instancetype)titled {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"titled" type: typeType code: 'ptit']);
}
+ (instancetype)typeClass {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"typeClass" type: typeType code: 'type']);
}
+ (instancetype)unsignedInteger {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"unsignedInteger" type: typeType code: 'magn']);
}
+ (instancetype)version_ {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"version_" type: typeType code: 'vers']);
}
+ (instancetype)visible {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"visible" type: typeType code: 'pvis']);
}
+ (instancetype)window {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"window" type: typeType code: 'cwin']);
}
+ (instancetype)word {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"word" type: typeType code: 'cwor']);
}
+ (instancetype)writingCode {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"writingCode" type: typeType code: 'psct']);
}
+ (instancetype)yards {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"yards" type: typeType code: 'yard']);
}
+ (instancetype)zoomable {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"zoomable" type: typeType code: 'iszm']);
}
+ (instancetype)zoomed {
    static id obj;
    return obj ?: (obj = [self.class symbolWithName: @"zoomed" type: typeType code: 'pzum']);
}
@end

