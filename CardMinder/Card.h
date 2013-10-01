//
//  Card.h
//  CardMinder
//
//  Created by Zach Burns on 9/24/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property NSString *name;
@property NSString *cardType;
@property UIImage *cardImage;
@property int iconNumber;
@property BOOL checkedOut;
@property BOOL premadeIcon;
@property BOOL pictureTaken;

@end
