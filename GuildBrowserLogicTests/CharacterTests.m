//
//  CharacterTests.m
//  GuildBrowser
//
//  Created by Stephen Bedford on 28/04/2014.
//  Copyright (c) 2014 Charlie Fulton. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Character.h"
#import "Item.h"

@interface CharacterTests : XCTestCase

@end

@implementation CharacterTests
{
    // 1 Remember that test classes can have instance variables, just like any other Objective-C class. Here you create the instance variable _characterDetailJson to store your sample JSON data.
    NSDictionary *_characterDetailJson;
    
    
    // --ADDED _testGuy
    Character *_testGuy;
}

// 2 Remember that setUp is called before each test case. This is useful because you only have to code up the loading once, and can manipulate this data however you wish in each test case.
-(void)setUp
{
    // 3 To correctly load the data file, remember this is running as a test bundle. You need to send self.class to the NSBundle method for finding bundled resources.
    NSURL *dataServiceURL = [[NSBundle bundleForClass:self.class]
                             URLForResource:@"character" withExtension:@"json"];
    
    // 4 Create NSData from the loaded resource.
    NSData *sampleData = [NSData dataWithContentsOfURL:dataServiceURL];
    NSError *error;
    
    // 5 Now create the JSON data and store it in your instance variable.
    id json = [NSJSONSerialization JSONObjectWithData:sampleData
                                              options:kNilOptions
                                                error:&error];
    
    
    XCTAssertNotNil(json, @"invalid test data");
    
    
    _characterDetailJson = json;
}

-(void)tearDown
{
    // 6 Remember that tearDown is called after each test case. This is a great spot to clean up.
    _characterDetailJson = nil;
}


// 1 Here you are creating test cases for the Character class designated initializer method, which takes an NSDictionary from the JSON data and sets up the properties in the class. This might seem trivial, but remember that when developing the app, it’s best to add the tests while you are incrementally developing the class.
- (void)testCreateCharacterFromDetailJson
{
    // 2 Here you are just validating that initWithCharacterDetailData does indeed return something, using another STAssert macro to make sure it’s not nil.
    Character *testGuy1 = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    XCTAssertNotNil(testGuy1, @"Could not create character from detail json");
    
    // 3 This one is more of a negative test, verifying that you still got a Character back even though you passed in a nil NSDictionary of data.
    Character *testGuy2 = [[Character alloc] initWithCharacterDetailData:nil];
    XCTAssertNotNil(testGuy2, @"Could not create character from nil data");
}


// 1
-(void)testCreateCharacterFromDetailJsonProps
{
    // --ADDED _testGuy
    
    NSLog(@"SteveTEst1");
    
    _testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    XCTAssertNotNil(_testGuy, @"Could not create character from detail json");
    
    XCTAssertEqualObjects(_testGuy.thumbnail, @"borean-tundra/171/40508075-avatar.jpg", @"thumbnail url is wrong");
    XCTAssertEqualObjects(_testGuy.name, @"Hagrel", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.battleGroup, @"Emberstorm", @"battlegroup is wrong");
    XCTAssertEqualObjects(_testGuy.realm, @"Borean Tundra", @"realm is wrong");
    XCTAssertEqualObjects(_testGuy.achievementPoints, @3130, @"achievement points is wrong");
    XCTAssertEqualObjects(_testGuy.level,@85, @"level is wrong");
    
    XCTAssertEqualObjects(_testGuy.classType, @"Warrior", @"class type is wrong");
    XCTAssertEqualObjects(_testGuy.race, @"Human", @"race is wrong");
    XCTAssertEqualObjects(_testGuy.gender, @"Male", @"gener is wrong");
    XCTAssertEqualObjects(_testGuy.averageItemLevel, @379, @"avg item level is wrong");
    XCTAssertEqualObjects(_testGuy.averageItemLevelEquipped, @355, @"avg item level is wrong");
}


// 2
-(void)testCreateCharacterFromDetailJsonValidateItems
{
    // --ADDED _testGuy
    _testGuy = [[Character alloc] initWithCharacterDetailData:_characterDetailJson];
    XCTAssertNotNil(_testGuy, @"Could not create character from detail json");
    
    XCTAssertEqualObjects(_testGuy.neckItem.name,@"Stoneheart Choker", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.wristItem.name,@"Vicious P1yrium Bracers", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.waistItem.name,@"Girdle of the Queen's Champion", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.handsItem.name,@"Time Strand Gauntlets", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.shoulderItem.name,@"Temporal Pauldrons", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.chestItem.name,@"Ruthless Gladiator's Plate Chestpiece", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.fingerItem1.name,@"Thrall's Gratitude", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.fingerItem2.name,@"Breathstealer Band", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.shirtItem.name,@"Black Swashbuckler's Shirt", @"name is wrong");
    XCTAssertEqualObjects(_testGuy.tabardItem.name,@"Tabard of the Wildhammer Clan", @"nname is wrong");
    XCTAssertEqualObjects(_testGuy.headItem.name,@"Vicious Pyrium Helm", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.backItem.name,@"Cloak of the Royal Protector", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.legsItem.name,@"Bloodhoof Legguards", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.feetItem.name,@"Treads of the Past", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.mainHandItem.name,@"Axe of the Tauren Chieftains", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.offHandItem.name,nil, @"offhand should be nil");
    XCTAssertEqualObjects(_testGuy.trinketItem1.name,@"Rosary of Light", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.trinketItem2.name,@"Bone-Link Fetish", @"neck name is wrong");
    XCTAssertEqualObjects(_testGuy.rangedItem.name,@"Ironfeather Longbow", @"neck name is wrong");
}






@end