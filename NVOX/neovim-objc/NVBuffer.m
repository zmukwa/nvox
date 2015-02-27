/**
* Tae Won Ha — @hataewon
*
* http://taewon.de
* http://qvacua.com
*
* See LICENSE
*/

#import "NVBuffer.h"


@implementation NVBuffer {

}

- (instancetype)initWithRawIdentifier:(NSData *)rawIdentifier {
  self = [super init];
  if (self) {
    _rawIdentifier = rawIdentifier;
  }

  return self;
}

- (NSString *)description {
  NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
  [description appendFormat:@"self.rawIdentifier=%@", self.rawIdentifier];
  [description appendString:@">"];
  return description;
}

@end
