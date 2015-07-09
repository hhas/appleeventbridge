//
//  NSAppleEventDescriptor+AEDescExtensions.m
//

#import "NSAppleEventDescriptor+AEDescExtensions.h"

#if __MAC_OS_X_VERSION_MIN_REQUIRED < 101100

@implementation NSAppleEventDescriptor (AEDescExtensions)

+ (instancetype)descriptorWithDate:(NSDate *)date {
    LongDateTime longDate;
    if (UCConvertCFAbsoluteTimeToLongDateTime(date.timeIntervalSinceReferenceDate, &longDate) != noErr) return nil; // LEGACY API
    return [self.class descriptorWithDescriptorType: typeLongDateTime bytes: &longDate length: sizeof(longDate)];
}

+ (instancetype)currentProcessDescriptor {
    ProcessSerialNumber psn = {0, kCurrentProcess}; // DEPRECATED API
    return [NSAppleEventDescriptor descriptorWithDescriptorType: typeProcessSerialNumber bytes: &psn length: sizeof(psn)];
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

- (instancetype)sendEventWithOptions:(AESendMode)sendOptions timeout:(NSTimeInterval)timeoutInSeconds error:(NSError * __autoreleasing *)error {
    if (error) *error = nil;
    AEDesc reply = {typeNull, NULL};
    OSStatus err = AESendMessage(self.aeDesc, &reply, sendOptions, (long)(timeoutInSeconds > 0 ? timeoutInSeconds * 60 : timeoutInSeconds)); // LEGACY API
    if (err != noErr) {
        if (error) *error = [NSError errorWithDomain: NSOSStatusErrorDomain code: err userInfo: nil];
        return nil;
    }
    return [[self.class alloc] initWithAEDescNoCopy: &reply];
}


@end

#endif
