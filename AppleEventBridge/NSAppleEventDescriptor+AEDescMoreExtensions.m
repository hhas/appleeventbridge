//
//  NSAppleEventDescriptor+AEDescMoreExtensions.m
//

#import "NSAppleEventDescriptor+AEDescMoreExtensions.h"



@implementation NSAppleEventDescriptor (AEDescMoreExtensions)

+ (instancetype)descriptorWithDouble:(double)number {
    return [self.class descriptorWithDescriptorType: typeIEEE64BitFloatingPoint bytes: &number length: sizeof(number)];
}

+ (instancetype)descriptorWithFileURL:(NSURL *)fileURL {
    if (![fileURL isFileURL]) return nil;
    NSData *data = [fileURL.absoluteString dataUsingEncoding: NSUTF8StringEncoding];
    return [self.class descriptorWithDescriptorType: typeFileURL data: data];
}

+ (instancetype)descriptorWithProcessID:(pid_t)pid {
    return [self.class descriptorWithDescriptorType: typeKernelProcessID bytes: &pid length: sizeof(pid)];
}

+ (instancetype)descriptorWithApplicationURL:(NSURL *)url {
    NSData *data = [url.absoluteString dataUsingEncoding: NSUTF8StringEncoding];
    return [NSAppleEventDescriptor descriptorWithDescriptorType: typeApplicationURL data: data];
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
    return [NSURL URLWithString: [[NSString alloc] initWithData: desc.data encoding: NSUTF8StringEncoding]];
}

@end
