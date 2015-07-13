//
//  AEMURL.h
//
//
//

#import "AEMUtils.h"

@interface AEMURL : NSURL <AEMSelfPackingProtocol> {
 
    NSAppleEventDescriptor *desc;
    
}

- (instancetype)initFileURLWithDescriptor:(NSAppleEventDescriptor *)desc_ path:(NSString *)path;

// compatibility methods

// some Carbon-based applications may still use HFS paths as parameters/results
- (instancetype)initFileURLWithHFSPath:(NSString *)path;

@property (readonly) NSString *HFSPath;

// coerce underlying AEDesc to a specific type (typeAlias/typeFileURL/typeObjectSpecifier/typeFSRef/typeFSS/typeBookmarkData) and return as new AEMURL instance; this should only be needed if dealing with a [Carbon-based] application that doesn't automatically coerce supplied parameters to the required type itself
- (instancetype)coerceToDescriptorType:(DescType)descType;

@end
