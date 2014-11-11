//
//  AEMFormatter.h
//
//  Given instances of AEMQuery, AEMEvent and bridged Foundation classes, outputs
//  their source code representation (or a reasonable facsimile). Used by various
//  AEM -description methods.
//

#import "AEMUtils.h"


NSString *AEMFormatObject(id obj);

NSString *AEMFormatOSType(OSType code);


