//
//  TZCheckInViewController.m
//  CardMinder
//
//  Created by Zach Burns on 10/1/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import "TZCheckInViewController.h"
#import "Card.h"
#import "CardViewController.h"

@interface TZCheckInViewController ()

@end

@implementation TZCheckInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//////////////////////////////////////
//                                  //
//----- Get Selected Card Info -----//
//                                  //
//////////////////////////////////////

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    CardViewController *cardViewController = (CardViewController *)[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    
    NSIndexPath *indexPath = [cardViewController.tableView indexPathForSelectedRow];
    Card *card = [cardViewController.cards objectAtIndex:indexPath.row];
    UILabel *checkedOutCardName = (UILabel *) [self.view viewWithTag:109];
    checkedOutCardName.text = card.name;
    UILabel *checkedOutCardType = (UILabel *) [self.view viewWithTag:110];
    checkedOutCardType.text = card.cardType;
    UIImageView *checkedOutCardImage = (UIImageView *) [self.view viewWithTag:111];
    checkedOutCardImage.image = card.cardImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/////////////////////////////
//                         //
//----- Check Card In -----//
//                         //
/////////////////////////////

- (IBAction)checkInCard:(id)sender
{
    CardViewController *cardViewController = (CardViewController *)[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    
    NSIndexPath *indexPath = [cardViewController.tableView indexPathForSelectedRow];
    Card *card = [cardViewController.cards objectAtIndex:indexPath.row];
    card.checkedOut = NO;
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}

@end
