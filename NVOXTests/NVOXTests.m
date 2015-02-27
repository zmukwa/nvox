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
#import "MessagePackParser.h"


@interface NVOXTests : XCTestCase

@end

@implementation NVOXTests

- (void)testSth {
  NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"vim_get_buffers.example" ofType:@"msgpack"];
  NSData *data = [NSData dataWithContentsOfFile:path];

  id o = [MessagePackParser parseData:data];
  NSLog(@"%@", o);
}

- (void)testGetBuffersResponse {
  // [type=1, msgid, error, result]
  NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"vim_get_buffers.example" ofType:@"msgpack"];
  NSData *data = [NSData dataWithContentsOfFile:path];

  msgpack_zone mempool;
  msgpack_zone_init(&mempool, 2048);

  msgpack_object deserialized;
  msgpack_unpack((char const *) data.bytes, data.length, NULL, &mempool, &deserialized);

  msgpack_object *array = deserialized.via.array.ptr;

  NSLog(@"msgid: %@", @(array[1].via.u64));
  msgpack_object result = array[3];
  msgpack_object *buffers = result.via.array.ptr;
  uint32_t countBuffers = result.via.array.size;
  for (uint32_t i = 0; i < countBuffers; ++i) {
    msgpack_object buffer = buffers[i];
    NSData *bufferData = [NSData dataWithBytes:buffer.via.ext.ptr length:buffer.via.ext.size];
    NSLog(@"buffer %d: %@", i, bufferData);
  }

  msgpack_zone_destroy(&mempool);
}

@end
