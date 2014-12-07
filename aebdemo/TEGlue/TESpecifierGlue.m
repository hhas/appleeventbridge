//
// TESpecifierGlue.m
// TextEdit
// AppleEventBridge 0.7.0
//

#import "TESpecifierGlue.h"

@implementation TESpecifier
- (NSString *)description {
    return [TEFormatter formatObject: aemQuery appData: appData];
}

/* Elements */

- (instancetype)applications {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'capp']];
}
- (instancetype)attachment {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'atts']];
}
- (instancetype)attributeRuns {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'catr']];
}
- (instancetype)characters {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'cha ']];
}
- (instancetype)colors {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'colr']];
}
- (instancetype)documents {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'docu']];
}
- (instancetype)items {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'cobj']];
}
- (instancetype)paragraphs {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'cpar']];
}
- (instancetype)printSettings {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'pset']];
}
- (instancetype)text {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'ctxt']];
}
- (instancetype)windows {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'cwin']];
}
- (instancetype)words {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery elements: 'cwor']];
}

/* Properties */

- (instancetype)bounds {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'pbnd']];
}
- (instancetype)class_ {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'pcls']];
}
- (instancetype)closeable {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'hclb']];
}
- (instancetype)collating {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'lwcl']];
}
- (instancetype)color {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'colr']];
}
- (instancetype)copies {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'lwcp']];
}
- (instancetype)document {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'docu']];
}
- (instancetype)endingPage {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'lwlp']];
}
- (instancetype)errorHandling {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'lweh']];
}
- (instancetype)faxNumber {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'faxn']];
}
- (instancetype)fileName {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'atfn']];
}
- (instancetype)floating {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'isfl']];
}
- (instancetype)font {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'font']];
}
- (instancetype)frontmost {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'pisf']];
}
- (instancetype)id_ {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'ID  ']];
}
- (instancetype)index {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'pidx']];
}
- (instancetype)miniaturizable {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'ismn']];
}
- (instancetype)miniaturized {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'pmnd']];
}
- (instancetype)modal {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'pmod']];
}
- (instancetype)modified {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'imod']];
}
- (instancetype)name {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'pnam']];
}
- (instancetype)pagesAcross {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'lwla']];
}
- (instancetype)pagesDown {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'lwld']];
}
- (instancetype)path {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'ppth']];
}
- (instancetype)properties {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'pALL']];
}
- (instancetype)requestedPrintTime {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'lwqt']];
}
- (instancetype)resizable {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'prsz']];
}
- (instancetype)size {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'ptsz']];
}
- (instancetype)startingPage {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'lwfp']];
}
- (instancetype)targetPrinter {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'trpr']];
}
- (instancetype)titled {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'ptit']];
}
- (instancetype)version_ {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'vers']];
}
- (instancetype)visible {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'pvis']];
}
- (instancetype)zoomable {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'iszm']];
}
- (instancetype)zoomed {
    return [self.class specifierWithAppData: appData
                                   aemQuery: [(AEMObjectSpecifier *)aemQuery property: 'pzum']];
}

/* Commands */

- (TEActivateCommand *)activate {
    return [TEActivateCommand commandWithAppData: appData
                       eventClass: 'misc'
                          eventID: 'actv'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEActivateCommand *)activate:(id)directParameter {
    return [TEActivateCommand commandWithAppData: appData
                       eventClass: 'misc'
                          eventID: 'actv'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TECloseCommand *)close {
    return [TECloseCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'clos'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TECloseCommand *)close:(id)directParameter {
    return [TECloseCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'clos'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TECountCommand *)count {
    return [TECountCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'cnte'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TECountCommand *)count:(id)directParameter {
    return [TECountCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'cnte'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEDeleteCommand *)delete {
    return [TEDeleteCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'delo'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEDeleteCommand *)delete:(id)directParameter {
    return [TEDeleteCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'delo'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEDuplicateCommand *)duplicate {
    return [TEDuplicateCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'clon'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEDuplicateCommand *)duplicate:(id)directParameter {
    return [TEDuplicateCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'clon'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEExistsCommand *)exists {
    return [TEExistsCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'doex'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEExistsCommand *)exists:(id)directParameter {
    return [TEExistsCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'doex'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEGetCommand *)get {
    return [TEGetCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'getd'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEGetCommand *)get:(id)directParameter {
    return [TEGetCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'getd'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TELaunchCommand *)launch {
    return [TELaunchCommand commandWithAppData: appData
                       eventClass: 'ascr'
                          eventID: 'noop'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TELaunchCommand *)launch:(id)directParameter {
    return [TELaunchCommand commandWithAppData: appData
                       eventClass: 'ascr'
                          eventID: 'noop'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEMakeCommand *)make {
    return [TEMakeCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'crel'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEMakeCommand *)make:(id)directParameter {
    return [TEMakeCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'crel'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEMoveCommand *)move {
    return [TEMoveCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'move'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEMoveCommand *)move:(id)directParameter {
    return [TEMoveCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'move'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEOpenCommand *)open {
    return [TEOpenCommand commandWithAppData: appData
                       eventClass: 'aevt'
                          eventID: 'odoc'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEOpenCommand *)open:(id)directParameter {
    return [TEOpenCommand commandWithAppData: appData
                       eventClass: 'aevt'
                          eventID: 'odoc'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEOpenLocationCommand *)openLocation {
    return [TEOpenLocationCommand commandWithAppData: appData
                       eventClass: 'GURL'
                          eventID: 'GURL'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEOpenLocationCommand *)openLocation:(id)directParameter {
    return [TEOpenLocationCommand commandWithAppData: appData
                       eventClass: 'GURL'
                          eventID: 'GURL'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEPrintCommand *)print {
    return [TEPrintCommand commandWithAppData: appData
                       eventClass: 'aevt'
                          eventID: 'pdoc'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEPrintCommand *)print:(id)directParameter {
    return [TEPrintCommand commandWithAppData: appData
                       eventClass: 'aevt'
                          eventID: 'pdoc'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEQuitCommand *)quit {
    return [TEQuitCommand commandWithAppData: appData
                       eventClass: 'aevt'
                          eventID: 'quit'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEQuitCommand *)quit:(id)directParameter {
    return [TEQuitCommand commandWithAppData: appData
                       eventClass: 'aevt'
                          eventID: 'quit'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TEReopenCommand *)reopen {
    return [TEReopenCommand commandWithAppData: appData
                       eventClass: 'aevt'
                          eventID: 'rapp'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TEReopenCommand *)reopen:(id)directParameter {
    return [TEReopenCommand commandWithAppData: appData
                       eventClass: 'aevt'
                          eventID: 'rapp'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TERunCommand *)run {
    return [TERunCommand commandWithAppData: appData
                       eventClass: 'aevt'
                          eventID: 'oapp'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TERunCommand *)run:(id)directParameter {
    return [TERunCommand commandWithAppData: appData
                       eventClass: 'aevt'
                          eventID: 'oapp'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TESaveCommand *)save {
    return [TESaveCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'save'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TESaveCommand *)save:(id)directParameter {
    return [TESaveCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'save'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
- (TESetCommand *)set {
    return [TESetCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'setd'
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: aemQuery];
}
- (TESetCommand *)set:(id)directParameter {
    return [TESetCommand commandWithAppData: appData
                       eventClass: 'core'
                          eventID: 'setd'
                  directParameter: directParameter
                      parentQuery: aemQuery];
}
@end

