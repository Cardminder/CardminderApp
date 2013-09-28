//
//  TZAddCardViewController.h
//  CardMinder
//
//  Created by Zach Burns on 9/25/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZAddCardViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIButton *selectIcon;
@property (nonatomic, retain) UIImageView *selectedIcon;
@property (strong, nonatomic) IBOutlet UIImageView *iconView;


@end
