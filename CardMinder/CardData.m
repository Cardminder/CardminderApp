//
//  Card.m
//  CardMinder
//
//  Created by Zach Burns on 9/24/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import "CardData.h"

@implementation CardData

@synthesize name = _name;
@synthesize cardType = _cardType;
@synthesize checkedOut = _checkedOut;

- (id)initWithName:(NSString *)name type:(NSString *)cardType _Bool:(BOOL)checkedOut
{
    if ((self = [super init])) {
        _name = [name copy];
        _cardType = [cardType copy];
        _checkedOut = checkedOut;
    }
    return self;
}


#define kNameKey    @"Name"
#define kTypeKey    @"cardType"
#define kOutKey     @"checkedOut"


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:kNameKey];
    [aCoder encodeObject:_cardType forKey:kTypeKey];
    [aCoder encodeBool:_checkedOut forKey:kOutKey];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSString *name = [aDecoder decodeObjectForKey:kNameKey];
    NSString *cardType = [aDecoder decodeObjectForKey:kTypeKey];
    BOOL checkedOut = [aDecoder decodeObjectForKey:kOutKey];
    return [self initWithName:name type:cardType _Bool:checkedOut];
}


@end
