//
//  Card.h
//  CardMinder
//
//  Created by Zach Burns on 9/24/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardData : NSObject <NSCoding>

@property NSString *_name;
@property NSString *_cardType;
@property BOOL _checkedOut;

@property (copy) NSString *name;
@property (copy) NSString *cardType;
@property BOOL checkedOut;

- (id)initWithName:(NSString *)name type:(NSString *)cardType bool:(BOOL)checkedOut;

@end
