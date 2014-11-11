//
//  NSAppleEventDescriptor+AEDescExtensions.h
//
//  Adds missing functionality to NSAppleEventDescriptor.
//
//  The following methods wrap essential legacy/deprecated Carbon APIs (third-party code should not have to rely on such APIs to build and send Apple events):
//
//      +descriptorWithDate:
//      +currentProcessDescriptor
//      -isRecordDescriptor
//      -dateValue
//      -sendAppleEventWithMode:timeout:error:
//
//  Other methods are provided for convenience/completeness.
//
//  To keep patch size to a minimum, this does not implement a comprehensive set of pack/unpack methods. e.g. +descriptorWithBundleID: is not provided as Apple Event Manager may be flaky with bundle IDs; +descriptorWithNumber: is not provided as no one mapping strategy is guaranteed to work with all processes (e.g. some apps may have problems with typeUInt64, but packing all NSNumbers as typeSInt32/typeIEEE64BitFloatingPoint could cause other problems due to lost precision).
//


#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>


// TO DO: if/when <rdar://problem/4976113> is fixed, delete next line and get rid of AESendThreadSafe files
#import "AESendThreadSafe.h"


@interface NSAppleEventDescriptor (AEDescExtensions)

// Given a value, create and return an autoreleased NSAppleEventDescriptor that contains that value, with an appropriate type (typeLongDateTime, typeIEEE64BitFloatingPoint, or typeFileURL, respectively).
+ (instancetype)descriptorWithDate:(NSDate *)date;
+ (instancetype)descriptorWithDouble:(double)number;
+ (instancetype)descriptorWithFileURL:(NSURL *)fileURL;


// Given a target process identifier, create and return an autoreleased NSAppleEventDescriptor suitable for use in +appleEventWithEventClass:eventID:targetDescriptor:returnID:transactionID:.
+ (instancetype)currentProcessDescriptor;
+ (instancetype)descriptorWithProcessID:(pid_t)pid;
+ (instancetype)descriptorWithApplicationURL:(NSURL *)url; // Note: Apple Event Manager only recognizes `eppc:` URLs in targetDescriptor.


// AERecords can have an abitrary descriptorType. This allows you to check if the descriptor is truly an AERecord.
- (BOOL)isRecordDescriptor;


// Return the contents of a descriptor, after coercing the descriptor's contents to typeLongDateTime, typeIEEE64BitFloatingPoint, or typeFileURL, respectively.
@property (readonly) NSDate *dateValue;
@property (readonly) double doubleValue;
@property (readonly) NSURL *fileURLValue;


// Send an Apple event to a target process. On success, returns the reply event containing the result value or error returned by the target process. If an Apple Event Manager error occurs, returns nil and if `error` is not nil an NSError containing the Carbon error code.
- (instancetype)sendAppleEventWithMode:(AESendMode)sendMode timeout:(long)timeOutInTicks error:(NSError * __autoreleasing *)error;

@end
