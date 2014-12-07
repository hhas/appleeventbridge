//
//  NSAppleEventDescriptor+AEDescExtensions.h
//
//  Adds essential missing functionality to NSAppleEventDescriptor.
//
//  These methods wrap legacy/deprecated Carbon APIs that are essential in building and sending Apple events.
//

#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>


@interface NSAppleEventDescriptor (AEDescExtensions)

// Creating and Initializing Descriptors

/*
 Creates a descriptor initialized with Apple event type typeLongDateTime that stores the specified date.

 Parameters
 
    date -- The date to be stored in the returned descriptor.
 
 Return Value
 
    A descriptor containing the specified date, or nil if an error occurs.
 */
+ (instancetype)descriptorWithDate:(NSDate *)date;


/*
 Creates an address descriptor initialized with Apple event type typeProcessSerialNumber that identifies the current process.
 
 Return Value
 
    A descriptor identifying the current process, or nil if an error occurs.
 */
+ (instancetype)currentProcessDescriptor;



// Getting Information About a Descriptor

/*
 Apple event records can have an abitrary descriptorType. This allows you to check if the descriptor is truly a record.
 
 Return Value
    
    YES if the descriptor is an Apple event record; otherwise, NO.
 */
- (BOOL)isRecordDescriptor;


/*
 Returns the contents of the receiver as a date, coercing (to typeLongDateTime) if necessary.
 
 Return Value
 
    The contents of the descriptor, as a date, or nil if an error occurs.
 */
@property (readonly) NSDate *dateValue;



// Sending an Apple event

/*
 Sends an Apple event to a target process.
 
 Parameters
 
    sendMode -- Specifies various options for how the server application should handle the Apple event. To obtain a value for this parameter, you add together constants to set bits that specify the reply mode, the interaction level, and the application switch mode. For more information, see “AESendMode”.
 
    timeOutInTicks -- If the reply mode specified in the sendMode parameter is kAEWaitReply, this parameter specifies the length of time (in ticks) that the client application is willing to wait for the reply from the server application before timing out. Most applications should use the kAEDefaultTimeout constant, which tells the Apple Event Manager to provide an appropriate timeout duration. If the value of this parameter is kNoTimeOut, the Apple event never times out. These constants are described in “Timeout Constants.”
 
    error -- The error that occurred if the event could not be sent. For more information, see “Apple Event Manager Result Codes.”

 Return Value
 
    The reply Apple event from the server application, if you specified the kAEWaitReply flag in the sendMode parameter, or a null descriptor (one with descriptor type typeNull) if you specified the kAEQueueReply or kAENoReply flag, or nil if an error occurred. If you specify the kAEQueueReply flag in the sendMode parameter, you receive the reply Apple event in your event queue.
 
 Special Considerations
 
    The -sendAppleEventWithMode:timeout:error: method is both asynchronous and thread-safe, so you could, for example, set up a thread to send an Apple event and wait for a reply. If you use threads, you must add a typeReplyPortAttr attribute to your event that identifies the Mach port on which to receive the reply.
 */
- (instancetype)sendAppleEventWithMode:(AESendMode)sendMode timeout:(long)timeOutInTicks error:(NSError * __autoreleasing *)error;

@end


