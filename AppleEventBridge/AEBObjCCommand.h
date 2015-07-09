//
//  AEBObjCCommand.h
//
//  Base class for all XXCommand classes in static ObjC glues.
//

#import "AEBCommand.h"

#import "AEBSpecifier.h"
#import "AEBSymbol.h"


/**********************************************************************/
// Command base


@interface AEBObjCCommand : AEBCommand

+ (instancetype)commandWithAppData:(AEBAppData *)appData
                        eventClass:(AEEventClass)classCode
                           eventID:(AEEventID)code
                   directParameter:(id)directParameter
                       parentQuery:(AEMQuery *)parentQuery; // TO DO: this method is kept for backwards compatibility with ObjC glue generator, but should be revised once that's sorted
/*
 * Specify the desired type for the return value. Where the application's event
 * handler supports this, it will attempt to coerce the event's result to this
 * type before returning it. May be a standard AE type (e.g. AEBSymbol.alias)
 * or, occasionally, an application-defined type.
 *
 * Note that most applications don't support this, and those that do usually
 * only support it for 'get' events (e.g. Finder).
 */
- (instancetype)requestedClass:(AEBSymbol *)classConstant;

/*
 * Specify the AE type that the returned AEDesc must be coerced to before unpacking.
 * Whereas the -requestedType: method adds a kAERequestedType parameter to the outgoing
 * event, this coercion is performed locally by the -sendWithError: method using a
 * built-in or user-installed AE coercion handler if one is available. Note that if
 * the coercion fails, -sendWithError: will return nil and the associated NSError's
 * error code will be -1700 (errAECoercionFail).
 *
 * If the specified type is typeWildCard (the default), no coercion is performed.
 */
- (instancetype)returnClass:(AEBSymbol *)classConstant;

/*
 * Similar to -returnType:, except that the returned AEDesc is first coerced to
 * to typeAEList; each list item is then coerced to the specified type.
 */
- (instancetype)returnListOfClass:(AEBSymbol *)classConstant;

/*
 * Send the event with minimal error reporting.
 *
 * Return value
 *
 *    The value returned by the application, or an NSNull instance if no value was returned,
 *    or nil if an error occurred.
 *
 * Notes
 *
 *    Convenience method; [evt send] is equivalent to [evt sendWithError: nil]
 */
- (id)send;

// display formatting; subclasses will override these

- (NSString *)aebCommandName; // TO DO: rename these
- (NSString *)aebParameterNameForCode:(DescType)code;
- (NSString *)aebFormatObject:(id)obj appData:(id)appData; // TO DO: better type sig for appData arg

@end


/**********************************************************************/


@interface AEBGetSetItemCommand : AEBObjCCommand
@end

