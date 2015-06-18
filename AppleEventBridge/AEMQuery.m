//
//  AEMQuery.m
//

#import "AEMQuery.h"
#import "AEMSpecifier.h"


/**********************************************************************/
// AEM query base (shared by specifiers and tests)

@implementation AEMQuery


+ (AEMApplicationRoot *)app {
    static dispatch_once_t pred = 0;
    __strong static AEMApplicationRoot *root = nil;
    dispatch_once(&pred, ^{
        root = [[AEMApplicationRoot alloc] init];
    });
    return root;
}

+ (AEMCurrentContainerRoot *)con {
    static dispatch_once_t pred = 0;
    __strong static AEMCurrentContainerRoot *root = nil;
    dispatch_once(&pred, ^{
        root = [[AEMCurrentContainerRoot alloc] init];
    });
    return root;
}

+ (AEMObjectBeingExaminedRoot *)its {
    static dispatch_once_t pred = 0;
    __strong static AEMObjectBeingExaminedRoot *root = nil;
    dispatch_once(&pred, ^{
        root = [[AEMObjectBeingExaminedRoot alloc] init];
    });
    return root;
}

+ (AEMCustomRoot *)customRoot:(id)rootObject {
    return [[AEMCustomRoot alloc] initWithRootObject: rootObject];
}


- (instancetype)init {
	self = [super init];
	if (!self) return self;
	cachedDesc = nil;
	return self;
}


- (void)setCachedDesc:(NSAppleEventDescriptor *)desc {
    cachedDesc = desc;
}


- (AEMQueryRoot *)root { // stub method; subclasses will override this
	return nil;
}

- (id)resolveWithObject:(id)object { // stub method; subclasses will override this
	return nil;
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
    // stub method; subclasses will override this
	return nil;
}

- (NSAppleEventDescriptor *)packWithCodecs:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
	@synchronized(self) {
		if (!cachedDesc) cachedDesc = [self packWithCodecsNoCache: codecs error: error];
        return cachedDesc;
	}
}

@end

