//
//  WowUtilsTests.m
//  GuildBrowser
//
//  Created by Stephen Bedford on 28/04/2014.
//  Copyright (c) 2014 Charlie Fulton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WowUtils.h"

@interface WowUtilsTests : XCTestCase

@end

@implementation WowUtilsTests

//http://stackoverflow.com/questions/21296864/ocmock-link-error
//dont use ST anymore - use XCTAssertEqualObjects
//You are using XCUnit (the Xcode 5 unit testing framework), but you are calling STAssertEqualObjects (from OCUnit, the Xcode 4 unit testing framework). Simply change that to XCTAssertEqualObjects.

//also some examples on XTCAssert = http://stackoverflow.com/questions/21000189/how-to-unit-test-two-objects-are-not-equal-in-ios-xctestcase


// 1
-(void)testCharacterClassNameLookup
{
    // 2
    //The expected result, “Warrior”, is compared to the result from the WowUtils method; if the test fails, you log the message “ClassType should be Warrior”.
    //STAssertEqualObjects(@"Warrior",                         [WoWUtils classFromCharacterType:1],                         @"ClassType should be Warrior");
    XCTAssertEqualObjects(@"Warrior", [WoWUtils classFromCharacterType:1], @"ClassType should be Warrior");
    
    // 3
    //It’s always good to include a “failing test” in your test case. This is a test where the result is expected to fail. Again, you are using one of the assertion macros from the SenTestingKit – this time STAssertFalse.
    //The expected result, “Mage”, is compared to the result from the WowUtils method; if the test fails, you use the default message, since you passed in nil in this example.
    //STAssertFalse([@"Mage" isEqualToString:[WoWUtils classFromCharacterType:2]],nil);
    XCTAssertFalse([@"Mage" isEqual:[WoWUtils classFromCharacterType:2]], @"The objects should not be equal");
    
    
    // 4
    //STAssertTrue([@"Paladin" isEqualToString:[WoWUtils classFromCharacterType:2]],nil);
    XCTAssertTrue([@"Paladin" isEqual:[WoWUtils classFromCharacterType:2]]);

    // add the rest as an exercise
}

- (void)testRaceTypeLookup
{
    //STAssertEqualObjects(@"Human", [WoWUtils raceFromRaceType:1], nil);
    XCTAssertEqualObjects(@"Human", [WoWUtils raceFromRaceType:1]);
    
   // STAssertEqualObjects(@"Orc", [WoWUtils raceFromRaceType:2], nil);
    XCTAssertEqualObjects(@"Orc", [WoWUtils raceFromRaceType:2]);

   //STAssertFalse([@"Night Elf" isEqualToString:[WoWUtils raceFromRaceType:45]],nil);

   XCTAssertFalse([@"Night Elf" isEqualToString:[WoWUtils raceFromRaceType:45]]);
    
   // add the rest as an exercise
    
}

- (void)testQualityLookup
{
    //STAssertEquals(@"Grey", [WoWUtils qualityFromQualityType:1], nil);
    XCTAssertEqualObjects(@"Grey", [WoWUtils qualityFromQualityType:1]);

    
    //STAssertFalse([@"Purple" isEqualToString:[WoWUtils qualityFromQualityType:10]],nil);
    XCTAssertFalse([@"Purple" isEqualToString:[WoWUtils qualityFromQualityType:10]]);

    // add the rest as an exercise
}

@end





/*
 @implementation WowUtilsTests
 
 - (void)setUp
 {
 [super setUp];
 // Put setup code here. This method is called before the invocation of each test method in the class.
 }
 
 - (void)tearDown
 {
 // Put teardown code here. This method is called after the invocation of each test method in the class.
 [super tearDown];
 }
 
 - (void)testExample
 {
 XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
 }
 
 @end
 */


