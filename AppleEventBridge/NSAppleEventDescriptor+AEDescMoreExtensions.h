//
//  NSAppleEventDescriptor+AEDescMoreExtensions.h
//
//  Adds non-essential missing functionality to NSAppleEventDescriptor for convenience and completeness.
//
//  These methods are not essential as double values, process IDs, and file and eppc URLs can be packed and unpacked using existing NSAppleEventDescriptor methods, but they do make it much easier to work with these commonly used types.
//
//  Submitted as enhancement request <rdar://problem/19169791>
//

#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>


@interface NSAppleEventDescriptor (AEDescMoreExtensions)

// Creating and Initializing Descriptors

/*
 Creates a descriptor initialized with Apple event type typeIEEE64BitFloatingPoint that stores the specified double value.

 Parameters
 
    number -- The double value to be stored in the returned descriptor.
 
 Return Value
 
    A descriptor containing the specified double value, or nil if an error occurs.
 */
+ (instancetype)descriptorWithDouble:(double)number;


/*
 Creates a descriptor initialized with Apple event type typeFileURL that stores the specified file URL.

 Parameters
 
    fileURL -- The file URL to be stored in the returned descriptor.
 
 Return Value
 
    A descriptor containing the specified file URL, or nil if an error occurs.
 */
+ (instancetype)descriptorWithFileURL:(NSURL *)fileURL;


/*
 Creates an address descriptor initialized with Apple event type typeKernelProcessID that identifies the specified local process.
 
 Parameters
 
    pid -- The identifier of the process (often called process ID).
 
 Return Value
 
    A descriptor identifying the specified process, or nil if an error occurs.
 */
+ (instancetype)descriptorWithProcessID:(pid_t)pid;


/*
 Creates an address descriptor initialized with Apple event type typeApplicationURL that identifies the specified remote process.
 
 Parameters
 
    url -- The eppc URL that identifies the process.
 
 Return Value
 
    A descriptor identifying the specified process, or nil if an error occurs.
 */
+ (instancetype)descriptorWithApplicationURL:(NSURL *)url;



// Getting Information About a Descriptor

/*
 Returns the contents of the receiver as an integer, coercing (to typeIEEE64BitFloatingPoint) if necessary.

 Return Value
 
    The contents of the descriptor, as a double value, or 0.0 if an error occurs.
 */
@property (readonly) double doubleValue;


/*
 Returns the contents of the receiver as a file URL, coercing (to typeFileURL) if necessary.

 Return Value
 
    The contents of the descriptor, as a file URL, or nil if an error occurs.
 */
@property (readonly) NSURL *fileURLValue;


@end
