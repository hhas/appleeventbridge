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
    AEB_RETURN_SYMBOL(@"applicationResponses", typeEnumerated, 'rmte');
}

+ (AEBSymbol *)ask {
    AEB_RETURN_SYMBOL(@"ask", typeEnumerated, 'ask ');
}

+ (AEBSymbol *)case_ {
    AEB_RETURN_SYMBOL(@"case_", typeEnumerated, 'case');
}

+ (AEBSymbol *)diacriticals {
    AEB_RETURN_SYMBOL(@"diacriticals", typeEnumerated, 'diac');
}

+ (AEBSymbol *)expansion {
    AEB_RETURN_SYMBOL(@"expansion", typeEnumerated, 'expa');
}

+ (AEBSymbol *)hyphens {
    AEB_RETURN_SYMBOL(@"hyphens", typeEnumerated, 'hyph');
}

+ (AEBSymbol *)no {
    AEB_RETURN_SYMBOL(@"no", typeEnumerated, 'no  ');
}

+ (AEBSymbol *)numericStrings {
    AEB_RETURN_SYMBOL(@"numericStrings", typeEnumerated, 'nume');
}

+ (AEBSymbol *)punctuation {
    AEB_RETURN_SYMBOL(@"punctuation", typeEnumerated, 'punc');
}

+ (AEBSymbol *)whitespace {
    AEB_RETURN_SYMBOL(@"whitespace", typeEnumerated, 'whit');
}

+ (AEBSymbol *)yes {
    AEB_RETURN_SYMBOL(@"yes", typeEnumerated, 'yes ');
}


/* Types and properties */

+ (AEBSymbol *)April {
    AEB_RETURN_SYMBOL(@"April", typeType, 'apr ');
}

+ (AEBSymbol *)August {
    AEB_RETURN_SYMBOL(@"August", typeType, 'aug ');
}

+ (AEBSymbol *)December {
    AEB_RETURN_SYMBOL(@"December", typeType, 'dec ');
}

+ (AEBSymbol *)EPSPicture {
    AEB_RETURN_SYMBOL(@"EPSPicture", typeType, 'EPS ');
}

+ (AEBSymbol *)February {
    AEB_RETURN_SYMBOL(@"February", typeType, 'feb ');
}

+ (AEBSymbol *)Friday {
    AEB_RETURN_SYMBOL(@"Friday", typeType, 'fri ');
}

+ (AEBSymbol *)GIFPicture {
    AEB_RETURN_SYMBOL(@"GIFPicture", typeType, 'GIFf');
}

+ (AEBSymbol *)JPEGPicture {
    AEB_RETURN_SYMBOL(@"JPEGPicture", typeType, 'JPEG');
}

+ (AEBSymbol *)January {
    AEB_RETURN_SYMBOL(@"January", typeType, 'jan ');
}

+ (AEBSymbol *)July {
    AEB_RETURN_SYMBOL(@"July", typeType, 'jul ');
}

+ (AEBSymbol *)June {
    AEB_RETURN_SYMBOL(@"June", typeType, 'jun ');
}

+ (AEBSymbol *)March {
    AEB_RETURN_SYMBOL(@"March", typeType, 'mar ');
}

+ (AEBSymbol *)May {
    AEB_RETURN_SYMBOL(@"May", typeType, 'may ');
}

+ (AEBSymbol *)Monday {
    AEB_RETURN_SYMBOL(@"Monday", typeType, 'mon ');
}

+ (AEBSymbol *)November {
    AEB_RETURN_SYMBOL(@"November", typeType, 'nov ');
}

+ (AEBSymbol *)October {
    AEB_RETURN_SYMBOL(@"October", typeType, 'oct ');
}

+ (AEBSymbol *)PICTPicture {
    AEB_RETURN_SYMBOL(@"PICTPicture", typeType, 'PICT');
}

+ (AEBSymbol *)RGB16Color {
    AEB_RETURN_SYMBOL(@"RGB16Color", typeType, 'tr16');
}

+ (AEBSymbol *)RGB96Color {
    AEB_RETURN_SYMBOL(@"RGB96Color", typeType, 'tr96');
}

+ (AEBSymbol *)RGBColor {
    AEB_RETURN_SYMBOL(@"RGBColor", typeType, 'cRGB');
}

+ (AEBSymbol *)Saturday {
    AEB_RETURN_SYMBOL(@"Saturday", typeType, 'sat ');
}

+ (AEBSymbol *)September {
    AEB_RETURN_SYMBOL(@"September", typeType, 'sep ');
}

+ (AEBSymbol *)Sunday {
    AEB_RETURN_SYMBOL(@"Sunday", typeType, 'sun ');
}

+ (AEBSymbol *)TIFFPicture {
    AEB_RETURN_SYMBOL(@"TIFFPicture", typeType, 'TIFF');
}

+ (AEBSymbol *)Thursday {
    AEB_RETURN_SYMBOL(@"Thursday", typeType, 'thu ');
}

+ (AEBSymbol *)Tuesday {
    AEB_RETURN_SYMBOL(@"Tuesday", typeType, 'tue ');
}

+ (AEBSymbol *)Wednesday {
    AEB_RETURN_SYMBOL(@"Wednesday", typeType, 'wed ');
}

+ (AEBSymbol *)alias {
    AEB_RETURN_SYMBOL(@"alias", typeType, 'alis');
}

+ (AEBSymbol *)anything {
    AEB_RETURN_SYMBOL(@"anything", typeType, '****');
}

+ (AEBSymbol *)applicationBundleID {
    AEB_RETURN_SYMBOL(@"applicationBundleID", typeType, 'bund');
}

+ (AEBSymbol *)applicationSignature {
    AEB_RETURN_SYMBOL(@"applicationSignature", typeType, 'sign');
}

+ (AEBSymbol *)applicationURL {
    AEB_RETURN_SYMBOL(@"applicationURL", typeType, 'aprl');
}

+ (AEBSymbol *)best {
    AEB_RETURN_SYMBOL(@"best", typeType, 'best');
}

+ (AEBSymbol *)bookmarkData {
    AEB_RETURN_SYMBOL(@"bookmarkData", typeType, 'bmrk');
}

+ (AEBSymbol *)boolean {
    AEB_RETURN_SYMBOL(@"boolean", typeType, 'bool');
}

+ (AEBSymbol *)boundingRectangle {
    AEB_RETURN_SYMBOL(@"boundingRectangle", typeType, 'qdrt');
}

+ (AEBSymbol *)centimeters {
    AEB_RETURN_SYMBOL(@"centimeters", typeType, 'cmtr');
}

+ (AEBSymbol *)class_ {
    AEB_RETURN_SYMBOL(@"class_", typeType, 'pcls');
}

+ (AEBSymbol *)classInfo {
    AEB_RETURN_SYMBOL(@"classInfo", typeType, 'gcli');
}

+ (AEBSymbol *)colorTable {
    AEB_RETURN_SYMBOL(@"colorTable", typeType, 'clrt');
}

+ (AEBSymbol *)cubicCentimeters {
    AEB_RETURN_SYMBOL(@"cubicCentimeters", typeType, 'ccmt');
}

+ (AEBSymbol *)cubicFeet {
    AEB_RETURN_SYMBOL(@"cubicFeet", typeType, 'cfet');
}

+ (AEBSymbol *)cubicInches {
    AEB_RETURN_SYMBOL(@"cubicInches", typeType, 'cuin');
}

+ (AEBSymbol *)cubicMeters {
    AEB_RETURN_SYMBOL(@"cubicMeters", typeType, 'cmet');
}

+ (AEBSymbol *)cubicYards {
    AEB_RETURN_SYMBOL(@"cubicYards", typeType, 'cyrd');
}

+ (AEBSymbol *)dashStyle {
    AEB_RETURN_SYMBOL(@"dashStyle", typeType, 'tdas');
}

+ (AEBSymbol *)data {
    AEB_RETURN_SYMBOL(@"data", typeType, 'rdat');
}

+ (AEBSymbol *)date {
    AEB_RETURN_SYMBOL(@"date", typeType, 'ldt ');
}

+ (AEBSymbol *)decimalStruct {
    AEB_RETURN_SYMBOL(@"decimalStruct", typeType, 'decm');
}

+ (AEBSymbol *)degreesCelsius {
    AEB_RETURN_SYMBOL(@"degreesCelsius", typeType, 'degc');
}

+ (AEBSymbol *)degreesFahrenheit {
    AEB_RETURN_SYMBOL(@"degreesFahrenheit", typeType, 'degf');
}

+ (AEBSymbol *)degreesKelvin {
    AEB_RETURN_SYMBOL(@"degreesKelvin", typeType, 'degk');
}

+ (AEBSymbol *)doubleInteger {
    AEB_RETURN_SYMBOL(@"doubleInteger", typeType, 'comp');
}

+ (AEBSymbol *)elementInfo {
    AEB_RETURN_SYMBOL(@"elementInfo", typeType, 'elin');
}

+ (AEBSymbol *)encodedString {
    AEB_RETURN_SYMBOL(@"encodedString", typeType, 'encs');
}

+ (AEBSymbol *)enumerator {
    AEB_RETURN_SYMBOL(@"enumerator", typeType, 'enum');
}

+ (AEBSymbol *)eventInfo {
    AEB_RETURN_SYMBOL(@"eventInfo", typeType, 'evin');
}

+ (AEBSymbol *)extendedFloat {
    AEB_RETURN_SYMBOL(@"extendedFloat", typeType, 'exte');
}

+ (AEBSymbol *)feet {
    AEB_RETURN_SYMBOL(@"feet", typeType, 'feet');
}

+ (AEBSymbol *)fileRef {
    AEB_RETURN_SYMBOL(@"fileRef", typeType, 'fsrf');
}

+ (AEBSymbol *)fileSpecification {
    AEB_RETURN_SYMBOL(@"fileSpecification", typeType, 'fss ');
}

+ (AEBSymbol *)fileURL {
    AEB_RETURN_SYMBOL(@"fileURL", typeType, 'furl');
}

+ (AEBSymbol *)fixed {
    AEB_RETURN_SYMBOL(@"fixed", typeType, 'fixd');
}

+ (AEBSymbol *)fixedPoint {
    AEB_RETURN_SYMBOL(@"fixedPoint", typeType, 'fpnt');
}

+ (AEBSymbol *)fixedRectangle {
    AEB_RETURN_SYMBOL(@"fixedRectangle", typeType, 'frct');
}

+ (AEBSymbol *)float_ {
    AEB_RETURN_SYMBOL(@"float_", typeType, 'doub');
}

+ (AEBSymbol *)float128bit {
    AEB_RETURN_SYMBOL(@"float128bit", typeType, 'ldbl');
}

+ (AEBSymbol *)gallons {
    AEB_RETURN_SYMBOL(@"gallons", typeType, 'galn');
}

+ (AEBSymbol *)grams {
    AEB_RETURN_SYMBOL(@"grams", typeType, 'gram');
}

+ (AEBSymbol *)graphicText {
    AEB_RETURN_SYMBOL(@"graphicText", typeType, 'cgtx');
}

+ (AEBSymbol *)inches {
    AEB_RETURN_SYMBOL(@"inches", typeType, 'inch');
}

+ (AEBSymbol *)integer {
    AEB_RETURN_SYMBOL(@"integer", typeType, 'long');
}

+ (AEBSymbol *)internationalText {
    AEB_RETURN_SYMBOL(@"internationalText", typeType, 'itxt');
}

+ (AEBSymbol *)internationalWritingCode {
    AEB_RETURN_SYMBOL(@"internationalWritingCode", typeType, 'intl');
}

+ (AEBSymbol *)kernelProcessID {
    AEB_RETURN_SYMBOL(@"kernelProcessID", typeType, 'kpid');
}

+ (AEBSymbol *)kilograms {
    AEB_RETURN_SYMBOL(@"kilograms", typeType, 'kgrm');
}

+ (AEBSymbol *)kilometers {
    AEB_RETURN_SYMBOL(@"kilometers", typeType, 'kmtr');
}

+ (AEBSymbol *)list {
    AEB_RETURN_SYMBOL(@"list", typeType, 'list');
}

+ (AEBSymbol *)liters {
    AEB_RETURN_SYMBOL(@"liters", typeType, 'litr');
}

+ (AEBSymbol *)locationReference {
    AEB_RETURN_SYMBOL(@"locationReference", typeType, 'insl');
}

+ (AEBSymbol *)longFixed {
    AEB_RETURN_SYMBOL(@"longFixed", typeType, 'lfxd');
}

+ (AEBSymbol *)longFixedPoint {
    AEB_RETURN_SYMBOL(@"longFixedPoint", typeType, 'lfpt');
}

+ (AEBSymbol *)longFixedRectangle {
    AEB_RETURN_SYMBOL(@"longFixedRectangle", typeType, 'lfrc');
}

+ (AEBSymbol *)longPoint {
    AEB_RETURN_SYMBOL(@"longPoint", typeType, 'lpnt');
}

+ (AEBSymbol *)longRectangle {
    AEB_RETURN_SYMBOL(@"longRectangle", typeType, 'lrct');
}

+ (AEBSymbol *)machPort {
    AEB_RETURN_SYMBOL(@"machPort", typeType, 'port');
}

+ (AEBSymbol *)machine {
    AEB_RETURN_SYMBOL(@"machine", typeType, 'mach');
}

+ (AEBSymbol *)machineLocation {
    AEB_RETURN_SYMBOL(@"machineLocation", typeType, 'mLoc');
}

+ (AEBSymbol *)meters {
    AEB_RETURN_SYMBOL(@"meters", typeType, 'metr');
}

+ (AEBSymbol *)miles {
    AEB_RETURN_SYMBOL(@"miles", typeType, 'mile');
}

+ (AEBSymbol *)missingValue {
    AEB_RETURN_SYMBOL(@"missingValue", typeType, 'msng');
}

+ (AEBSymbol *)null {
    AEB_RETURN_SYMBOL(@"null", typeType, 'null');
}

+ (AEBSymbol *)ounces {
    AEB_RETURN_SYMBOL(@"ounces", typeType, 'ozs ');
}

+ (AEBSymbol *)parameterInfo {
    AEB_RETURN_SYMBOL(@"parameterInfo", typeType, 'pmin');
}

+ (AEBSymbol *)pixelMapRecord {
    AEB_RETURN_SYMBOL(@"pixelMapRecord", typeType, 'tpmm');
}

+ (AEBSymbol *)point {
    AEB_RETURN_SYMBOL(@"point", typeType, 'QDpt');
}

+ (AEBSymbol *)pounds {
    AEB_RETURN_SYMBOL(@"pounds", typeType, 'lbs ');
}

+ (AEBSymbol *)processSerialNumber {
    AEB_RETURN_SYMBOL(@"processSerialNumber", typeType, 'psn ');
}

+ (AEBSymbol *)property {
    AEB_RETURN_SYMBOL(@"property", typeType, 'prop');
}

+ (AEBSymbol *)propertyInfo {
    AEB_RETURN_SYMBOL(@"propertyInfo", typeType, 'pinf');
}

+ (AEBSymbol *)quarts {
    AEB_RETURN_SYMBOL(@"quarts", typeType, 'qrts');
}

+ (AEBSymbol *)record {
    AEB_RETURN_SYMBOL(@"record", typeType, 'reco');
}

+ (AEBSymbol *)reference {
    AEB_RETURN_SYMBOL(@"reference", typeType, 'obj ');
}

+ (AEBSymbol *)rotation {
    AEB_RETURN_SYMBOL(@"rotation", typeType, 'trot');
}

+ (AEBSymbol *)script {
    AEB_RETURN_SYMBOL(@"script", typeType, 'scpt');
}

+ (AEBSymbol *)shortFloat {
    AEB_RETURN_SYMBOL(@"shortFloat", typeType, 'sing');
}

+ (AEBSymbol *)shortInteger {
    AEB_RETURN_SYMBOL(@"shortInteger", typeType, 'shor');
}

+ (AEBSymbol *)squareFeet {
    AEB_RETURN_SYMBOL(@"squareFeet", typeType, 'sqft');
}

+ (AEBSymbol *)squareKilometers {
    AEB_RETURN_SYMBOL(@"squareKilometers", typeType, 'sqkm');
}

+ (AEBSymbol *)squareMeters {
    AEB_RETURN_SYMBOL(@"squareMeters", typeType, 'sqrm');
}

+ (AEBSymbol *)squareMiles {
    AEB_RETURN_SYMBOL(@"squareMiles", typeType, 'sqmi');
}

+ (AEBSymbol *)squareYards {
    AEB_RETURN_SYMBOL(@"squareYards", typeType, 'sqyd');
}

+ (AEBSymbol *)string {
    AEB_RETURN_SYMBOL(@"string", typeType, 'TEXT');
}

+ (AEBSymbol *)styledClipboardText {
    AEB_RETURN_SYMBOL(@"styledClipboardText", typeType, 'styl');
}

+ (AEBSymbol *)styledText {
    AEB_RETURN_SYMBOL(@"styledText", typeType, 'STXT');
}

+ (AEBSymbol *)suiteInfo {
    AEB_RETURN_SYMBOL(@"suiteInfo", typeType, 'suin');
}

+ (AEBSymbol *)textStyleInfo {
    AEB_RETURN_SYMBOL(@"textStyleInfo", typeType, 'tsty');
}

+ (AEBSymbol *)typeClass {
    AEB_RETURN_SYMBOL(@"typeClass", typeType, 'type');
}

+ (AEBSymbol *)unicodeText {
    AEB_RETURN_SYMBOL(@"unicodeText", typeType, 'utxt');
}

+ (AEBSymbol *)unsignedInteger {
    AEB_RETURN_SYMBOL(@"unsignedInteger", typeType, 'magn');
}

+ (AEBSymbol *)utf16Text {
    AEB_RETURN_SYMBOL(@"utf16Text", typeType, 'ut16');
}

+ (AEBSymbol *)utf8Text {
    AEB_RETURN_SYMBOL(@"utf8Text", typeType, 'utf8');
}

+ (AEBSymbol *)version {
    AEB_RETURN_SYMBOL(@"version", typeType, 'vers');
}

+ (AEBSymbol *)writingCode {
    AEB_RETURN_SYMBOL(@"writingCode", typeType, 'psct');
}

+ (AEBSymbol *)yards {
    AEB_RETURN_SYMBOL(@"yards", typeType, 'yard');
}


@end

