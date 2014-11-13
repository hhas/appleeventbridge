//
//  NSAppleEventDescriptor+AEDescExtensions.m
//

#import "NSAppleEventDescriptor+AEDescExtensions.h"



@implementation NSAppleEventDescriptor (AEDescExtensions)


+ (instancetype)descriptorWithDate:(NSDate *)date {
    if (![date isKindOfClass: NSDate.class]) return nil;
    LongDateTime longDate;
    if (UCConvertCFAbsoluteTimeToLongDateTime(date.timeIntervalSinceReferenceDate, &longDate) != noErr) return nil; // LEGACY API
    return [self.class descriptorWithDescriptorType: typeLongDateTime bytes: &longDate length: sizeof(longDate)];
}

+ (instancetype)descriptorWithDouble:(double)number {
    return [self.class descriptorWithDescriptorType: typeIEEE64BitFloatingPoint bytes: &number length: sizeof(number)];
}

+ (instancetype)descriptorWithFileURL:(NSURL *)fileURL {
    if (!([fileURL isKindOfClass: NSURL.class] && [fileURL isFileURL])) return nil;
    NSData *data = [fileURL.absoluteString dataUsingEncoding: NSUTF8StringEncoding];
    return [self.class descriptorWithDescriptorType: typeFileURL data: data];
}



+ (instancetype)currentProcessDescriptor {
    ProcessSerialNumber psn = {0, kCurrentProcess}; // DEPRECATED API
    return [NSAppleEventDescriptor descriptorWithDescriptorType: typeProcessSerialNumber bytes: &psn length: sizeof(psn)];
}

+ (instancetype)descriptorWithProcessID:(pid_t)pid {
    return [self.class descriptorWithDescriptorType: typeKernelProcessID bytes: &pid length: sizeof(pid)];
}

+ (instancetype)descriptorWithApplicationURL:(NSURL *)url {
    NSData *data = [url.absoluteString dataUsingEncoding: NSUTF8StringEncoding];
    return [NSAppleEventDescriptor descriptorWithDescriptorType: typeApplicationURL data: data];
}



- (BOOL)isRecordDescriptor {
    return AECheckIsRecord(self.aeDesc); // LEGACY API
}



- (NSDate *)dateValue {
    LongDateTime longDate;
    CFAbsoluteTime cfTime;
    NSAppleEventDescriptor *desc = [self coerceToDescriptorType: typeLongDateTime];
    if (!desc) return nil;
    [desc.data getBytes: &longDate length: sizeof(longDate)];
    if (UCConvertLongDateTimeToCFAbsoluteTime(longDate, &cfTime) != noErr) return nil; // LEGACY API
    return [NSDate dateWithTimeIntervalSinceReferenceDate: cfTime];
}

- (double)doubleValue {
    double result = 0;
    NSAppleEventDescriptor *desc = [self coerceToDescriptorType: typeIEEE64BitFloatingPoint];
    if (desc) [desc.data getBytes: &result length: sizeof(result)];
    return result;
}

- (NSURL *)fileURLValue {
    NSAppleEventDescriptor *desc = [self coerceToDescriptorType: typeFileURL];
    if (!desc) return nil;
    NSString *string = [[NSString alloc] initWithData: desc.data encoding: NSUTF8StringEncoding];
    return [NSURL URLWithString: string];
}



- (instancetype)sendAppleEventWithMode:(AESendMode)sendMode timeout:(long)timeOutInTicks error:(NSError * __autoreleasing *)error {
    if (error) *error = nil;
    AEDesc reply = {typeNull, NULL};
    // TO DO: if/when <rdar://problem/4976113> is fixed, change next line to use AESendMessage
    OSStatus err = AEMSendMessageThreadSafe(self.aeDesc, &reply, sendMode, timeOutInTicks); // LEGACY API
    if (err != noErr) {
        if (error) *error = [NSError errorWithDomain: NSOSStatusErrorDomain code: err userInfo: nil];
        return nil;
    }
    return [[self.class alloc] initWithAEDescNoCopy: &reply];
}

@end
