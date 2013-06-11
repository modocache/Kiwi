//
// Licensed under the terms in License.txt
//
// Copyright 2010 Allen Ding. All rights reserved.
//

#import "Kiwi.h"
#import "KiwiTestConfiguration.h"
#import "TestClasses.h"

#if KW_TESTS_ENABLED

@interface KWExampleGroupBuilderTest : XCTestCase

@end

@implementation KWExampleGroupBuilderTest

- (void)testItShouldBuildExampleGroups {
    id exampleGroup = [[KWExampleGroupBuilder sharedExampleGroupBuilder] buildExampleGroups:^{}];
    XCTAssertNotNil(exampleGroup, @"expected example group to be created");
    XCTAssertFalse([[KWExampleGroupBuilder sharedExampleGroupBuilder] isBuildingExampleGroup], @"example group builder must be clean for other tests to run cleanly");
}

- (void)testItShouldRaiseWhenPopContextUnmatched {
    [[KWExampleGroupBuilder sharedExampleGroupBuilder] buildExampleGroups:^{
        XCTAssertThrows([[KWExampleGroupBuilder sharedExampleGroupBuilder] popContextNode], @"expected raised exception");
    }];
    XCTAssertFalse([[KWExampleGroupBuilder sharedExampleGroupBuilder] isBuildingExampleGroup], @"example group builder must be clean for other tests to run cleanly");
}

@end

#endif // #if KW_TESTS_ENABLED
