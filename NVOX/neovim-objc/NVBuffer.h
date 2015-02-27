/**
* Tae Won Ha — @hataewon
*
* http://taewon.de
* http://qvacua.com
*
* See LICENSE
*/

#import <Foundation/Foundation.h>


@interface NVBuffer : NSObject

@property (readonly) NSData *rawIdentifier;

- (instancetype)initWithRawIdentifier:(NSData *)rawIdentifier;
- (NSString *)description;

@end
