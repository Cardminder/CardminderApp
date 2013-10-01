//
//  TZAddCardViewController.m
//  CardMinder
//
//  Created by Zach Burns on 9/25/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import "Card.h"
#import "CardViewController.h"
#import "TZAddCardViewController.h"
#import "TZIconTableViewController.h"

@interface TZAddCardViewController ()
{
    UIImagePickerController *mediaPicker;
    IBOutlet UIImageView *iconView;
    UIImage *chosenIcon;
    NSString *cardTypeString;
    BOOL premade;
    BOOL picture;
}
- (IBAction)showActionSheet:(id)sender;

@end

@implementation TZAddCardViewController

@synthesize iconView;
@synthesize iconArray;


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.cardTypeArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.cardTypeArray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (row) {
        case 0:
            self.type.text = @"Credit Card";
            cardTypeString = @"Credit Card";
            break;
        case 1:
            self.type.text = @"Debit Card";
            cardTypeString = @"Debit Card";
            break;
        case 2:
            self.type.text = @"Gift Card";
            cardTypeString = @"Gift Card";
            break;
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    chosenIcon = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!chosenIcon)
    {
        chosenIcon = [info objectForKey:UIImagePickerControllerOriginalImage];
        
    }
    if (chosenIcon) {
        self.iconView.image = chosenIcon;
    }
    
    picture = YES;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if (buttonIndex == 0)
    {
        /*mediaPicker = [[UIImagePickerController alloc] init];
        mediaPicker.delegate = self;
        mediaPicker.allowsEditing = YES;
        mediaPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

        premade = YES;
        
        [self presentViewController:mediaPicker animated:YES completion:nil];*/
        
       
        
        TZIconTableViewController *iconViewController = [[TZIconTableViewController alloc] init];
        [self presentViewController:iconViewController animated:YES completion:nil];
        
        

    }
    if (buttonIndex == 1)
    {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            mediaPicker = [[UIImagePickerController alloc] init];
            mediaPicker.delegate = self;
            mediaPicker.allowsEditing = YES;
            mediaPicker.sourceType = UIImagePickerControllerSourceTypeCamera;

        }
        
        picture = YES;
        
        [self presentViewController:mediaPicker animated:YES completion:nil];

    }
}


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
    newCard.cardImage = chosenIcon;
    newCard.cardType = cardTypeString;
    if (premade) {
        newCard.premadeIcon = YES;
        newCard.pictureTaken = NO;
    } if (picture) {
        newCard.pictureTaken = YES;
        newCard.premadeIcon = NO;
    }
    
    CardViewController *cardViewController = (CardViewController *)[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    
    [cardViewController.cards addObject:newCard];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
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
    
    self.cardTypeArray = [[NSArray alloc] initWithObjects:@"Credit Card", @"Debit Card", @"Gift Card", nil];
    
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
