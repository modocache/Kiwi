//
// Licensed under the terms in License.txt
//
// Copyright 2010 Allen Ding. All rights reserved.
//

#import "Kiwi.h"
#import "KiwiTestConfiguration.h"

#if KW_TESTS_ENABLED

@interface KWStringContainsMatcherTest : XCTestCase
@end

@implementation KWStringContainsMatcherTest

- (void)testShouldMatchItemIfItContainsTheSubstring
{
  XCTAssertTrue([hasSubstring(@"sub") matches:@"123sub456"], @"Should match string with correct substring");
}

- (void)testShouldNotMatchItemIfItDoesNotContainTheSubstring
{
  XCTAssertFalse([hasSubstring(@"sub") matches:@"123456"], @"Should not match string with incorrect substring");
}

- (void)testShouldNotMatchItemIfItIsNotAString
{
  XCTAssertFalse([hasSubstring(@"sub") matches:@[]], @"Should match string with array");
}

@end

#endif // #if KW_TESTS_ENABLED
