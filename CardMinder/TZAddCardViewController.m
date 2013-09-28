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
{
    UIImagePickerController *mediaPicker;
    IBOutlet UIImageView *iconView;
}
- (IBAction)showActionSheet:(id)sender;

@end

@implementation TZAddCardViewController

@synthesize iconView;

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenIcon = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!chosenIcon)
    {
        chosenIcon = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    if (chosenIcon) {
        self.iconView.image = chosenIcon;
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Choose Existing Icon"])
    {
        mediaPicker = [[UIImagePickerController alloc] init];
        mediaPicker.delegate = self;
        mediaPicker.allowsEditing = YES;
        mediaPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    }
    if ([buttonTitle isEqualToString:@"Take Photo"])
    {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            mediaPicker = [[UIImagePickerController alloc] init];
            mediaPicker.delegate = self;
            mediaPicker.allowsEditing = YES;
            mediaPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }

    }
   
    [self presentViewController:mediaPicker animated:YES completion:nil];
    

}


/*- (IBAction)showMoreIcons:(id)sender
{
    //[self.navigationController ;
}*/

- (IBAction)showActionSheet:(id)sender
{
    NSString *actionSheetTitle = @"Choose Icon";
    NSString *icon = @"Choose Existing Icon";
    NSString *pic = @"Take Photo";
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
