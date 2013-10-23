//
//  CardDoc.m
//  CardMinder
//
//  Created by Zach Burns on 10/2/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import "CardDoc.h"
#import "CardData.h"
#import "CardDatabase.h"

#define kDataKey    @"Data"
#define kDataFile   @"data.plist"
#define kImageFile  @"cardImage.png"

@implementation CardDoc
@synthesize data = _data;
@synthesize cardImage = _cardImage;
@synthesize docPath = _docPath;

- (id)init {
    if ((self = [super init])) {
    }
    return self;
}

- (id)initWithDocPath:(NSString *)docPath {
    if ((self = [super init])) {
        _docPath = [docPath copy];
    }
    return self;
}

- (id)initWithName:(NSString *)name type:(NSString *)cardType _Bool:(BOOL)checkedOut image:(UIImage *)cardImage {
    if ((self = [super init])) {
        _data = [[CardData alloc] initWithName:name type:cardType _Bool:checkedOut];
        _cardImage = cardImage;
    }
    return self;
}

- (BOOL)createDataPath {
    if (_docPath == nil) {
        self.docPath = [CardDatabase nextCardDocPath];
    }
    
    NSError *error;
    BOOL success = [[NSFileManager defaultManager]
                    createDirectoryAtPath:_docPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!success) {
        NSLog(@"Error creating data path: %@", [error localizedDescription]);
    }
    return success;
}

- (CardData *)data {
    if (_data != nil) return _data;
    
    NSString *dataPath = [_docPath stringByAppendingPathComponent:kDataFile];
    NSData *codedData = [[NSData alloc] initWithContentsOfFile:dataPath];
    if (codedData == nil) return nil;
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
    _data = [unarchiver decodeObjectForKey:kDataKey];
    [unarchiver finishDecoding];
    
    return _data;
}

- (void)saveData {
    if (_data == nil) return;
    
    [self createDataPath];
    
    NSString *dataPath = [_docPath stringByAppendingPathComponent:kDataFile];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:_data forKey:kDataKey];
    [archiver finishEncoding];
    [data writeToFile:dataPath atomically:YES];
    
}

- (UIImage *)cardImage {
    if (_cardImage != nil) return _cardImage;
    
    NSString *cardImagePath = [_docPath stringByAppendingPathComponent:kImageFile];
    return [UIImage imageWithContentsOfFile:cardImagePath];
}

- (void)saveImages {
    if (_cardImage == nil) return;
    
    [self createDataPath];

    NSString *cardImagePath = [_docPath stringByAppendingPathComponent:kImageFile];
    NSData *cardImageData = UIImagePNGRepresentation(_cardImage);
    [cardImageData writeToFile:cardImagePath atomically:YES];
    
    self.cardImage = nil;
}

- (void)deleteDoc {
    NSError *error;
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:_docPath error:&error];
    if (!success) {
        NSLog(@"Error removing document path: %@", error.localizedDescription);
    }
}

@end
