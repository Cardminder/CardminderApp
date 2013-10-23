//
//  TZAddCardViewController.h
//  CardMinder
//
//  Created by Zach Burns on 9/25/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardDoc.h"



@interface TZAddCardViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource,UIPickerViewDelegate>

@property CardDoc *cardDoc;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIButton *selectIcon;
@property (nonatomic, retain) UIImageView *selectedIcon;
@property (strong, nonatomic) IBOutlet UIImageView *iconView;

@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) IBOutlet UIPickerView *cardTypePicker;
@property (strong, nonatomic) NSArray *cardTypeArray;

@property (strong, nonatomic) NSMutableArray *iconArray;

@end
