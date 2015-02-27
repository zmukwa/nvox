//
//  NVOXTests.m
//  NVOXTests
//
//  Created by Tae Won Ha on 21/02/15.
//  Copyright (c) 2015 Tae Won Ha. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

#import <msgpack.h>


@interface NVOXTests : XCTestCase

@end

@implementation NVOXTests

- (void)testExample {
  NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"vim_get_buffers.example" ofType:@"msgpack"];
  NSData *data = [NSData dataWithContentsOfFile:path];

  msgpack_zone mempool;
  msgpack_zone_init(&mempool, 2048);

  msgpack_object deserialized;
  msgpack_unpack((char const *) data.bytes, data.length, NULL, &mempool, &deserialized);

  printf("[");

  msgpack_object *p = deserialized.via.array.ptr;
  uint32_t count = deserialized.via.array.size;
  for (uint32_t i = 0; i < count; ++i) {
    msgpack_object element = p[i];
    msgpack_object_print(stdout, element);
    printf(", ");
  }

  printf("]");

  msgpack_zone_destroy(&mempool);
}

@end
