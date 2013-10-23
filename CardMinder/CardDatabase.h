//
//  CardDatabase.h
//  CardMinder
//
//  Created by Zach Burns on 10/2/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardDatabase : NSObject {
    
}

+ (NSMutableArray *)loadCardDocs;
+ (NSString *)nextCardDocPath;

@end
