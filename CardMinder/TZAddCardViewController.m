//
//  TZAddCardViewController.m
//  CardMinder
//
//  Created by Zach Burns on 9/25/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import "Card.h"
#import "TZAddCardViewController.h"

@interface TZAddCardViewController ()
- (IBAction)showActionSheet:(id)sender;
@end

@implementation TZAddCardViewController

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Choose Existing Icon"])
    {
        NSLog(@"Choose Existing Icon Pressed");
    }
    if ([buttonTitle isEqualToString:@"Take a Picture"])
    {
        NSLog(@"Take a picture pressed");
    }
    if ([buttonTitle isEqualToString:@"Cancel"])
    {
        NSLog(@"Cancel button pressed");
    }
}

- (IBAction)showActionSheet:(id)sender
{
    NSString *actionSheetTitle = @"Choose Icon";
    NSString *icon = @"Choose Existing Icon";
    NSString *pic = @"Take a picture";
    NSString *cancel = @"Cancel";
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:actionSheetTitle delegate:self cancelButtonTitle:cancel destructiveButtonTitle:nil otherButtonTitles:icon, pic, nil];
    [actionSheet showInView:self.view];
}

- (IBAction)popToRoot:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES]; 
    
}

- (IBAction)saveNewCard:(id)sender
{
    NSString *cardName = self.nameField.text;
    
    Card *newCard = [[Card alloc] init];
    newCard.name = cardName;
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) { 
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
