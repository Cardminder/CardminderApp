//
//  CardDoc.h
//  CardMinder
//
//  Created by Zach Burns on 10/2/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CardData;

@interface CardDoc : NSObject {
    CardData *_data;
    UIImage *_cardImage;
    NSString *_docPath;
}

@property (retain) CardData *data;
@property (retain) UIImage *cardImage;
@property (copy) NSString *docPath;

- (id)init;
- (id)initWithDocPath:(NSString *)docPath;
- (id)initWithName:(NSString *)name type:(NSString *)cardType bool:(BOOL)checkedOut image:(UIImage *)cardImage;
- (void)saveData;
- (void)saveImages;
- (void)deleteDoc;

@end
