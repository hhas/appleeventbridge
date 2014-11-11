//
//  AEBSymbol.m
//

#import "AEBStaticSymbol.h"


/**********************************************************************/


@implementation AEBSymbol

+ (instancetype)symbolWithName:(NSString *)name_ type:(DescType)type_ code:(OSType)code_ {
    NSAppleEventDescriptor *desc_;
	desc_ = [[NSAppleEventDescriptor alloc] initWithDescriptorType: type_
															 bytes: &code_
															length: sizeof(code_)];
    return [[self alloc] initWithName: name_ descriptor: desc_];
}

- (instancetype)initWithName:(NSString *)name_ descriptor:(NSAppleEventDescriptor *)desc_ {
	self = [super init];
	if (!self) return self;
	name = name_;
	desc = desc_;
	return self;
}


- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ %@]", self.class, name];
}

- (id)copyWithZone:(NSZone *)zone {
	return self;
}

- (NSUInteger)hash {
	return (NSUInteger)[desc typeCodeValue];
}

- (NSString *)AEBName {
	return name;
}

- (OSType)AEBCode {
	return [desc typeCodeValue];
}

- (NSAppleEventDescriptor *)AEBPackSelf:(id)codecs error:(NSError * __autoreleasing *)error {
	return desc;
}


/***********************************/
// Apple Event Manager-defined types and enumerators

+ (AEBSymbol *)symbolWithCode:(OSType)code_ {
    switch (code_) {
        case 'rmte': return self.applicationResponses;
        case 'ask ': return self.ask;
        case 'case': return self.case_;
        case 'diac': return self.diacriticals;
        case 'expa': return self.expansion;
        case 'hyph': return self.hyphens;
        case 'no  ': return self.no;
        case 'nume': return self.numericStrings;
        case 'punc': return self.punctuation;
        case 'whit': return self.whitespace;
        case 'yes ': return self.yes;
        case 'apr ': return self.April;
        case 'aug ': return self.August;
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
        case 'tr16': return self.RGB16Color;
        case 'tr96': return self.RGB96Color;
        case 'cRGB': return self.RGBColor;
        case 'sat ': return self.Saturday;
        case 'sep ': return self.September;
        case 'sun ': return self.Sunday;
        case 'TIFF': return self.TIFFPicture;
        case 'thu ': return self.Thursday;
        case 'tue ': return self.Tuesday;
        case 'wed ': return self.Wednesday;
        case 'alis': return self.alias;
        case '****': return self.anything;
        case 'bund': return self.applicationBundleID;
        case 'sign': return self.applicationSignature;
        case 'aprl': return self.applicationURL;
        case 'best': return self.best;
        case 'bmrk': return self.bookmarkData;
        case 'bool': return self.boolean;
        case 'qdrt': return self.boundingRectangle;
        case 'cmtr': return self.centimeters;
        case 'pcls': return self.class_;
        case 'gcli': return self.classInfo;
        case 'clrt': return self.colorTable;
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
        case 'comp': return self.doubleInteger;
        case 'elin': return self.elementInfo;
        case 'encs': return self.encodedString;
        case 'enum': return self.enumerator;
        case 'evin': return self.eventInfo;
        case 'exte': return self.extendedFloat;
        case 'feet': return self.feet;
        case 'fsrf': return self.fileRef;
        case 'fss ': return self.fileSpecification;
        case 'furl': return self.fileURL;
        case 'fixd': return self.fixed;
        case 'fpnt': return self.fixedPoint;
        case 'frct': return self.fixedRectangle;
        case 'doub': return self.float_;
        case 'ldbl': return self.float128bit;
        case 'galn': return self.gallons;
        case 'gram': return self.grams;
        case 'cgtx': return self.graphicText;
        case 'inch': return self.inches;
        case 'long': return self.integer;
        case 'itxt': return self.internationalText;
        case 'intl': return self.internationalWritingCode;
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
        case 'msng': return self.missingValue;
        case 'null': return self.null;
        case 'ozs ': return self.ounces;
        case 'pmin': return self.parameterInfo;
        case 'tpmm': return self.pixelMapRecord;
        case 'QDpt': return self.point;
        case 'lbs ': return self.pounds;
        case 'psn ': return self.processSerialNumber;
        case 'prop': return self.property;
        case 'pinf': return self.propertyInfo;
        case 'qrts': return self.quarts;
        case 'reco': return self.record;
        case 'obj ': return self.reference;
        case 'trot': return self.rotation;
        case 'scpt': return self.script;
        case 'sing': return self.shortFloat;
        case 'shor': return self.shortInteger;
        case 'sqft': return self.squareFeet;
        case 'sqkm': return self.squareKilometers;
        case 'sqrm': return self.squareMeters;
        case 'sqmi': return self.squareMiles;
        case 'sqyd': return self.squareYards;
        case 'TEXT': return self.string;
        case 'styl': return self.styledClipboardText;
        case 'STXT': return self.styledText;
        case 'suin': return self.suiteInfo;
        case 'tsty': return self.textStyleInfo;
        case 'type': return self.typeClass;
        case 'utxt': return self.unicodeText;
        case 'magn': return self.unsignedInteger;
        case 'ut16': return self.utf16Text;
        case 'utf8': return self.utf8Text;
        case 'vers': return self.version;
        case 'psct': return self.writingCode;
        case 'yard': return self.yards;
        default: return nil;
    }
}


/* Enumerators */

+ (AEBSymbol *)applicationResponses {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"applicationResponses" type: typeEnumerated code: 'rmte']);
}

+ (AEBSymbol *)ask {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"ask" type: typeEnumerated code: 'ask ']);
}

+ (AEBSymbol *)case_ {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"case_" type: typeEnumerated code: 'case']);
}

+ (AEBSymbol *)diacriticals {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"diacriticals" type: typeEnumerated code: 'diac']);
}

+ (AEBSymbol *)expansion {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"expansion" type: typeEnumerated code: 'expa']);
}

+ (AEBSymbol *)hyphens {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"hyphens" type: typeEnumerated code: 'hyph']);
}

+ (AEBSymbol *)no {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"no" type: typeEnumerated code: 'no  ']);
}

+ (AEBSymbol *)numericStrings {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"numericStrings" type: typeEnumerated code: 'nume']);
}

+ (AEBSymbol *)punctuation {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"punctuation" type: typeEnumerated code: 'punc']);
}

+ (AEBSymbol *)whitespace {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"whitespace" type: typeEnumerated code: 'whit']);
}

+ (AEBSymbol *)yes {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"yes" type: typeEnumerated code: 'yes ']);
}


/* Types and properties */

+ (AEBSymbol *)April {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"April" type: typeType code: 'apr ']);
}

+ (AEBSymbol *)August {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"August" type: typeType code: 'aug ']);
}

+ (AEBSymbol *)December {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"December" type: typeType code: 'dec ']);
}

+ (AEBSymbol *)EPSPicture {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"EPSPicture" type: typeType code: 'EPS ']);
}

+ (AEBSymbol *)February {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"February" type: typeType code: 'feb ']);
}

+ (AEBSymbol *)Friday {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"Friday" type: typeType code: 'fri ']);
}

+ (AEBSymbol *)GIFPicture {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"GIFPicture" type: typeType code: 'GIFf']);
}

+ (AEBSymbol *)JPEGPicture {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"JPEGPicture" type: typeType code: 'JPEG']);
}

+ (AEBSymbol *)January {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"January" type: typeType code: 'jan ']);
}

+ (AEBSymbol *)July {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"July" type: typeType code: 'jul ']);
}

+ (AEBSymbol *)June {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"June" type: typeType code: 'jun ']);
}

+ (AEBSymbol *)March {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"March" type: typeType code: 'mar ']);
}

+ (AEBSymbol *)May {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"May" type: typeType code: 'may ']);
}

+ (AEBSymbol *)Monday {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"Monday" type: typeType code: 'mon ']);
}

+ (AEBSymbol *)November {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"November" type: typeType code: 'nov ']);
}

+ (AEBSymbol *)October {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"October" type: typeType code: 'oct ']);
}

+ (AEBSymbol *)PICTPicture {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"PICTPicture" type: typeType code: 'PICT']);
}

+ (AEBSymbol *)RGB16Color {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"RGB16Color" type: typeType code: 'tr16']);
}

+ (AEBSymbol *)RGB96Color {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"RGB96Color" type: typeType code: 'tr96']);
}

+ (AEBSymbol *)RGBColor {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"RGBColor" type: typeType code: 'cRGB']);
}

+ (AEBSymbol *)Saturday {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"Saturday" type: typeType code: 'sat ']);
}

+ (AEBSymbol *)September {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"September" type: typeType code: 'sep ']);
}

+ (AEBSymbol *)Sunday {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"Sunday" type: typeType code: 'sun ']);
}

+ (AEBSymbol *)TIFFPicture {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"TIFFPicture" type: typeType code: 'TIFF']);
}

+ (AEBSymbol *)Thursday {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"Thursday" type: typeType code: 'thu ']);
}

+ (AEBSymbol *)Tuesday {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"Tuesday" type: typeType code: 'tue ']);
}

+ (AEBSymbol *)Wednesday {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"Wednesday" type: typeType code: 'wed ']);
}

+ (AEBSymbol *)alias {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"alias" type: typeType code: 'alis']);
}

+ (AEBSymbol *)anything {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"anything" type: typeType code: '****']);
}

+ (AEBSymbol *)applicationBundleID {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"applicationBundleID" type: typeType code: 'bund']);
}

+ (AEBSymbol *)applicationSignature {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"applicationSignature" type: typeType code: 'sign']);
}

+ (AEBSymbol *)applicationURL {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"applicationURL" type: typeType code: 'aprl']);
}

+ (AEBSymbol *)best {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"best" type: typeType code: 'best']);
}

+ (AEBSymbol *)bookmarkData {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"bookmarkData" type: typeType code: 'bmrk']);
}

+ (AEBSymbol *)boolean {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"boolean" type: typeType code: 'bool']);
}

+ (AEBSymbol *)boundingRectangle {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"boundingRectangle" type: typeType code: 'qdrt']);
}

+ (AEBSymbol *)centimeters {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"centimeters" type: typeType code: 'cmtr']);
}

+ (AEBSymbol *)class_ {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"class_" type: typeType code: 'pcls']);
}

+ (AEBSymbol *)classInfo {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"classInfo" type: typeType code: 'gcli']);
}

+ (AEBSymbol *)colorTable {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"colorTable" type: typeType code: 'clrt']);
}

+ (AEBSymbol *)cubicCentimeters {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"cubicCentimeters" type: typeType code: 'ccmt']);
}

+ (AEBSymbol *)cubicFeet {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"cubicFeet" type: typeType code: 'cfet']);
}

+ (AEBSymbol *)cubicInches {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"cubicInches" type: typeType code: 'cuin']);
}

+ (AEBSymbol *)cubicMeters {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"cubicMeters" type: typeType code: 'cmet']);
}

+ (AEBSymbol *)cubicYards {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"cubicYards" type: typeType code: 'cyrd']);
}

+ (AEBSymbol *)dashStyle {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"dashStyle" type: typeType code: 'tdas']);
}

+ (AEBSymbol *)data {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"data" type: typeType code: 'rdat']);
}

+ (AEBSymbol *)date {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"date" type: typeType code: 'ldt ']);
}

+ (AEBSymbol *)decimalStruct {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"decimalStruct" type: typeType code: 'decm']);
}

+ (AEBSymbol *)degreesCelsius {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"degreesCelsius" type: typeType code: 'degc']);
}

+ (AEBSymbol *)degreesFahrenheit {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"degreesFahrenheit" type: typeType code: 'degf']);
}

+ (AEBSymbol *)degreesKelvin {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"degreesKelvin" type: typeType code: 'degk']);
}

+ (AEBSymbol *)doubleInteger {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"doubleInteger" type: typeType code: 'comp']);
}

+ (AEBSymbol *)elementInfo {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"elementInfo" type: typeType code: 'elin']);
}

+ (AEBSymbol *)encodedString {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"encodedString" type: typeType code: 'encs']);
}

+ (AEBSymbol *)enumerator {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"enumerator" type: typeType code: 'enum']);
}

+ (AEBSymbol *)eventInfo {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"eventInfo" type: typeType code: 'evin']);
}

+ (AEBSymbol *)extendedFloat {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"extendedFloat" type: typeType code: 'exte']);
}

+ (AEBSymbol *)feet {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"feet" type: typeType code: 'feet']);
}

+ (AEBSymbol *)fileRef {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"fileRef" type: typeType code: 'fsrf']);
}

+ (AEBSymbol *)fileSpecification {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"fileSpecification" type: typeType code: 'fss ']);
}

+ (AEBSymbol *)fileURL {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"fileURL" type: typeType code: 'furl']);
}

+ (AEBSymbol *)fixed {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"fixed" type: typeType code: 'fixd']);
}

+ (AEBSymbol *)fixedPoint {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"fixedPoint" type: typeType code: 'fpnt']);
}

+ (AEBSymbol *)fixedRectangle {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"fixedRectangle" type: typeType code: 'frct']);
}

+ (AEBSymbol *)float_ {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"float_" type: typeType code: 'doub']);
}

+ (AEBSymbol *)float128bit {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"float128bit" type: typeType code: 'ldbl']);
}

+ (AEBSymbol *)gallons {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"gallons" type: typeType code: 'galn']);
}

+ (AEBSymbol *)grams {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"grams" type: typeType code: 'gram']);
}

+ (AEBSymbol *)graphicText {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"graphicText" type: typeType code: 'cgtx']);
}

+ (AEBSymbol *)inches {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"inches" type: typeType code: 'inch']);
}

+ (AEBSymbol *)integer {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"integer" type: typeType code: 'long']);
}

+ (AEBSymbol *)internationalText {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"internationalText" type: typeType code: 'itxt']);
}

+ (AEBSymbol *)internationalWritingCode {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"internationalWritingCode" type: typeType code: 'intl']);
}

+ (AEBSymbol *)kernelProcessID {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"kernelProcessID" type: typeType code: 'kpid']);
}

+ (AEBSymbol *)kilograms {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"kilograms" type: typeType code: 'kgrm']);
}

+ (AEBSymbol *)kilometers {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"kilometers" type: typeType code: 'kmtr']);
}

+ (AEBSymbol *)list {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"list" type: typeType code: 'list']);
}

+ (AEBSymbol *)liters {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"liters" type: typeType code: 'litr']);
}

+ (AEBSymbol *)locationReference {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"locationReference" type: typeType code: 'insl']);
}

+ (AEBSymbol *)longFixed {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"longFixed" type: typeType code: 'lfxd']);
}

+ (AEBSymbol *)longFixedPoint {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"longFixedPoint" type: typeType code: 'lfpt']);
}

+ (AEBSymbol *)longFixedRectangle {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"longFixedRectangle" type: typeType code: 'lfrc']);
}

+ (AEBSymbol *)longPoint {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"longPoint" type: typeType code: 'lpnt']);
}

+ (AEBSymbol *)longRectangle {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"longRectangle" type: typeType code: 'lrct']);
}

+ (AEBSymbol *)machPort {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"machPort" type: typeType code: 'port']);
}

+ (AEBSymbol *)machine {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"machine" type: typeType code: 'mach']);
}

+ (AEBSymbol *)machineLocation {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"machineLocation" type: typeType code: 'mLoc']);
}

+ (AEBSymbol *)meters {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"meters" type: typeType code: 'metr']);
}

+ (AEBSymbol *)miles {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"miles" type: typeType code: 'mile']);
}

+ (AEBSymbol *)missingValue {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"missingValue" type: typeType code: 'msng']);
}

+ (AEBSymbol *)null {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"null" type: typeType code: 'null']);
}

+ (AEBSymbol *)ounces {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"ounces" type: typeType code: 'ozs ']);
}

+ (AEBSymbol *)parameterInfo {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"parameterInfo" type: typeType code: 'pmin']);
}

+ (AEBSymbol *)pixelMapRecord {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"pixelMapRecord" type: typeType code: 'tpmm']);
}

+ (AEBSymbol *)point {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"point" type: typeType code: 'QDpt']);
}

+ (AEBSymbol *)pounds {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"pounds" type: typeType code: 'lbs ']);
}

+ (AEBSymbol *)processSerialNumber {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"processSerialNumber" type: typeType code: 'psn ']);
}

+ (AEBSymbol *)property {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"property" type: typeType code: 'prop']);
}

+ (AEBSymbol *)propertyInfo {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"propertyInfo" type: typeType code: 'pinf']);
}

+ (AEBSymbol *)quarts {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"quarts" type: typeType code: 'qrts']);
}

+ (AEBSymbol *)record {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"record" type: typeType code: 'reco']);
}

+ (AEBSymbol *)reference {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"reference" type: typeType code: 'obj ']);
}

+ (AEBSymbol *)rotation {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"rotation" type: typeType code: 'trot']);
}

+ (AEBSymbol *)script {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"script" type: typeType code: 'scpt']);
}

+ (AEBSymbol *)shortFloat {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"shortFloat" type: typeType code: 'sing']);
}

+ (AEBSymbol *)shortInteger {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"shortInteger" type: typeType code: 'shor']);
}

+ (AEBSymbol *)squareFeet {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"squareFeet" type: typeType code: 'sqft']);
}

+ (AEBSymbol *)squareKilometers {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"squareKilometers" type: typeType code: 'sqkm']);
}

+ (AEBSymbol *)squareMeters {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"squareMeters" type: typeType code: 'sqrm']);
}

+ (AEBSymbol *)squareMiles {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"squareMiles" type: typeType code: 'sqmi']);
}

+ (AEBSymbol *)squareYards {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"squareYards" type: typeType code: 'sqyd']);
}

+ (AEBSymbol *)string {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"string" type: typeType code: 'TEXT']);
}

+ (AEBSymbol *)styledClipboardText {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"styledClipboardText" type: typeType code: 'styl']);
}

+ (AEBSymbol *)styledText {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"styledText" type: typeType code: 'STXT']);
}

+ (AEBSymbol *)suiteInfo {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"suiteInfo" type: typeType code: 'suin']);
}

+ (AEBSymbol *)textStyleInfo {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"textStyleInfo" type: typeType code: 'tsty']);
}

+ (AEBSymbol *)typeClass {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"typeClass" type: typeType code: 'type']);
}

+ (AEBSymbol *)unicodeText {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"unicodeText" type: typeType code: 'utxt']);
}

+ (AEBSymbol *)unsignedInteger {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"unsignedInteger" type: typeType code: 'magn']);
}

+ (AEBSymbol *)utf16Text {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"utf16Text" type: typeType code: 'ut16']);
}

+ (AEBSymbol *)utf8Text {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"utf8Text" type: typeType code: 'utf8']);
}

+ (AEBSymbol *)version {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"version" type: typeType code: 'vers']);
}

+ (AEBSymbol *)writingCode {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"writingCode" type: typeType code: 'psct']);
}

+ (AEBSymbol *)yards {
    static id obj;
    return obj ?: (obj = [AEBSymbol symbolWithName: @"yards" type: typeType code: 'yard']);
}


@end

