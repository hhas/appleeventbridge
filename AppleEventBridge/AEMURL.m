//
//  AEMURL.m
//

#import "AEMURL.h"
#import "AEMFormatter.h"

@implementation AEMURL


- (instancetype)initFileURLWithDescriptor:(NSAppleEventDescriptor *)desc_ path:(NSString *)path {
    if (path) {
        self = [super initFileURLWithPath: path];
    } else {
        // TO DO: what if desc is typeAlias/typeBookmarkData?
        NSAppleEventDescriptor *urlDesc = [desc_ coerceToDescriptorType: typeFileURL];
        NSString *urlString = [[NSString alloc] initWithData: urlDesc.data encoding: NSUTF8StringEncoding];
        if (!urlString) return nil;
        self = [self initWithString: urlString];
    }
    if (!self) return self;
    desc = desc_;
    return self;
}


- (NSAppleEventDescriptor *)packWithCodecs:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
    if (error) *error = nil;
    if (!desc) {
        if (!self.fileURL) {
            if (error) *error = [NSError errorWithDomain: kAEMErrorDomain code: -1700
                                                userInfo: @{NSLocalizedDescriptionKey: @"Not a file: URL"}];
            return nil;
        }
        NSData *data = [self.absoluteString dataUsingEncoding: NSUTF8StringEncoding];
        if (!data) {
            if (error) *error = [NSError errorWithDomain: kAEMErrorDomain code: -1700
                                                userInfo: @{NSLocalizedDescriptionKey: @"Invalid encoding."}];
            return nil;
        }
        // pack as either typeAlias or typeFileURL depending on whether NSURL identifies file system object by reference (inode?) or path
        desc = [NSAppleEventDescriptor descriptorWithDescriptorType: ([self isFileReferenceURL] ? typeAlias : typeFileURL) data: data];
    }
    return desc;
}


// compatibility

- (instancetype)initFileURLWithHFSPath:(NSString *)path {
    NSAppleEventDescriptor *desc_ = AEMNewRecordOfType(typeObjectSpecifier);
    [desc_ setDescriptor: [NSAppleEventDescriptor descriptorWithTypeCode: 'file'] forKeyword: keyAEDesiredClass];
    [desc_ setDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: formName] forKeyword: keyAEKeyForm];
    [desc_ setDescriptor: [NSAppleEventDescriptor descriptorWithString: path] forKeyword: keyAEKeyData];
    [desc_ setDescriptor: [NSAppleEventDescriptor nullDescriptor] forKeyword: keyAEContainer];
    return [[self initFileURLWithDescriptor: desc_ path: nil] coerceToDescriptorType: typeFileURL];
}

- (instancetype)coerceToDescriptorType:(DescType)descType {
    if (desc && descType == desc.descriptorType) return self;
    NSAppleEventDescriptor *desc_ = [[self packWithCodecs: nil error: nil] coerceToDescriptorType: descType];
    return [[self.class alloc] initFileURLWithDescriptor: desc_ path: self.path];
}

- (NSString *)HFSPath {
    return [[self packWithCodecs: nil error: nil] coerceToDescriptorType: typeFileURL].stringValue;
}

@end
