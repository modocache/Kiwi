//
// Licensed under the terms in License.txt
//
// Copyright 2010 Allen Ding. All rights reserved.
//

#import "Kiwi.h"
#import "KiwiTestConfiguration.h"
#import "TestClasses.h"

#if KW_TESTS_ENABLED

@interface KWEqualMatcherTest : XCTestCase

@end

@implementation KWEqualMatcherTest

- (void)testItShouldHaveTheRightMatcherStrings {
    NSArray *matcherStrings = [KWEqualMatcher matcherStrings];
    NSArray *expectedStrings = @[@"equal:"];
    XCTAssertEqualObjects([matcherStrings sortedArrayUsingSelector:@selector(compare:)],
                         [expectedStrings sortedArrayUsingSelector:@selector(compare:)],
                         @"expected specific matcher strings");
}

- (void)testItShouldMatchEqualObjects {
    id subject = @"foo";
    id otherSubject = @"foo";
    id matcher = [KWEqualMatcher matcherWithSubject:subject];
    [matcher equal:otherSubject];
    XCTAssertTrue([matcher evaluate], @"expected positive match");
}

- (void)testItShouldNotMatchUnequalObjects {
    id subject = @"foo";
    id otherSubject = @"foos";
    id matcher = [KWEqualMatcher matcherWithSubject:subject];
    [matcher equal:otherSubject];
    XCTAssertFalse([matcher evaluate], @"expected negative match");
}

- (void)testItShouldMatchKiwiBoxedValuesWithKiwiBoxedValues {
  id matcher = [KWEqualMatcher matcherWithSubject:theValue(123)];
  [matcher equal:theValue(123)];
  XCTAssertTrue([matcher evaluate], @"expected positive match");
}

- (void)testItShouldMatchNumberBoxedValuesWithKiwiBoxedValues {
  id matcher = [KWEqualMatcher matcherWithSubject:@123];
  [matcher equal:theValue(123)];
  XCTAssertTrue([matcher evaluate], @"expected positive match");
}

- (void)testItShouldMatchKiwiBoxedValuesWithNumberBoxedValues {
  id matcher = [KWEqualMatcher matcherWithSubject:theValue(123)];
  [matcher equal:@123];
  XCTAssertTrue([matcher evaluate], @"expected positive match");
}

- (void)testItShouldMatchEqualPointerValues
{
    int subject = 123;
    id matcher = [KWEqualMatcher matcherWithSubject:thePointerValue(&subject)];
    [matcher equal:thePointerValue(&subject)];
    XCTAssertTrue([matcher evaluate], @"expected positive match");
}

- (void)testItShouldNotMatchUnequalPointerValues
{
    int subject = 123;
    id matcher = [KWEqualMatcher matcherWithSubject:thePointerValue(&subject)];
    [matcher equal:thePointerValue(NULL)];
    XCTAssertFalse([matcher evaluate], @"expected negative match");
}

- (void)testItShouldHaveHumanReadableDescription
{
  id matcher = [KWEqualMatcher matcherWithSubject:theValue(123)];
  [matcher equal:@"test value"];
  XCTAssertEqualObjects(@"equal \"test value\"", [matcher description], @"description should match");
}

@end

#endif // #if KW_TESTS_ENABLED
