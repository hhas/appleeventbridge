//
//  AEMFormatter.m
//

#import "AEMFormatter.h"


static void FormatObject(id obj, NSString *indent, NSMutableString *result) {
	[result appendString: indent];
	if ([obj isKindOfClass: NSArray.class]) {
		[result appendString: @"@["];
        BOOL useSep = NO;
		for (id item in (NSArray *)obj) {
			if (useSep) [result appendString: @", "];
			FormatObject(item, indent, result);
            useSep = YES;
		}
		[result appendString: @"]"];
		
	} else if ([obj isKindOfClass: NSDictionary.class]) {
		[result appendString: @"@{"];
        BOOL useSep = NO;
		for (id key in (NSDictionary *)obj) {
			if (useSep) [result appendString: @", "];
			FormatObject(key, indent, result);
			[result appendString: @": "];
			FormatObject(((NSDictionary *)obj)[key], @"", result);
            useSep = YES;
		}
		[result appendString: @"}"];
		
	} else if ([obj isKindOfClass: NSString.class]) {
		NSMutableString *tmp = [[NSMutableString alloc] initWithString: (NSString *)obj];
		[tmp replaceOccurrencesOfString: @"\\" withString: @"\\\\" options: 0 range: NSMakeRange(0, [tmp length])];
		[tmp replaceOccurrencesOfString: @"\"" withString: @"\\\"" options: 0 range: NSMakeRange(0, [tmp length])];
		[tmp replaceOccurrencesOfString: @"\r" withString: @"\\r" options: 0 range: NSMakeRange(0, [tmp length])];
		[tmp replaceOccurrencesOfString: @"\n" withString: @"\\n" options: 0 range: NSMakeRange(0, [tmp length])];
		[tmp replaceOccurrencesOfString: @"\t" withString: @"\\t" options: 0 range: NSMakeRange(0, [tmp length])];
		[result appendFormat: @"@\"%@\"", tmp];
	
	} else if ([obj isKindOfClass: NSNumber.class]) {
        [result appendFormat: @"@%@", (NSNumber *)obj];
		
	} else if ([obj isKindOfClass: NSDate.class]) {
		[result appendString: @"[NSDate dateWithString: "];
		FormatObject([obj description], @"", result);
		[result appendString: @"]"];
		
	} else if ([obj isKindOfClass: NSURL.class]) {
		[result appendString: @"[NSURL URLWithString: "];
		FormatObject([obj description], @"", result);
		[result appendString: @"]"];
	
	} else {
		[result appendFormat: @"%@", obj];
    }
}


//


NSString *AEMFormatObject(id obj) {
	NSMutableString *collector = [[NSMutableString alloc] init];
	FormatObject(obj, @"", collector);
	return [collector copy];
}


NSString *AEMFormatOSType(OSType code) {
    code = CFSwapInt32HostToBig(code);
    NSMutableString *str = [NSMutableString stringWithCapacity: 16];
    for (int i = 0; i < sizeof(code); i++) {
        char c = ((char*)(&code))[i];
        [str appendFormat: ((c < 32 || c > 126 || c == '\\' || c == '\'') ? @"\\x%02x" : @"%c"), c];
    }
    return str;
}

