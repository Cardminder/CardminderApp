//
//  TZIconTableViewController.h
//  CardMinder
//
//  Created by Zach Burns on 9/29/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TZIconTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UIImageView *premadeIconView;
@property (strong, nonatomic) IBOutlet UILabel *premadeIconName;
@property (strong, nonatomic) NSMutableArray *premadeIcons;
@property (strong, nonatomic) UIImage *chosenIcon;
@property (strong, nonatomic) IBOutlet UIButton *chooseIconButton;

@end
