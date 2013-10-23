//
//  TZEditCardViewController.m
//  CardMinder
//
//  Created by Zach Burns on 10/1/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import "TZEditCardViewController.h"
#import "CardViewController.h"
#import "CardData.h"
#import "CardDoc.h"

@interface TZEditCardViewController ()

@end

@implementation TZEditCardViewController

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
    
    CardViewController *cardViewController = (CardViewController *)[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-3];
    
    NSIndexPath *indexPath = [cardViewController.tableView indexPathForSelectedRow];
    CardDoc *card = [cardViewController.cards objectAtIndex:indexPath.row];
    UILabel *selectedCardName = (UILabel *) [self.view viewWithTag:112];
    selectedCardName.text = card.data.name;
    UILabel *selectedCardType = (UILabel *) [self.view viewWithTag:113];
    selectedCardType.text = card.data.cardType;
    UIImageView *selectedCardImage = (UIImageView *) [self.view viewWithTag:114];
    selectedCardImage.image = card.cardImage;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
