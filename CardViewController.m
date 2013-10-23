//
//  CardViewController.m
//  CardMinder
//
//  Created by Zach Burns on 9/24/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import "TZAddCardViewController.h"
#import "CardViewController.h"
#import "CardData.h"
#import "CardDoc.h"

@interface CardViewController ()

@end

@implementation CardViewController

@synthesize cards = _cards;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Items > %@", self.cards);

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.cards count];
}

// Allows deletion of cards

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CardDoc *doc = [_cards objectAtIndex:indexPath.row];
    [doc deleteDoc];
    
    [_cards removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
    // Conditionally decide which prototype table cell to display based on BOOL checkedOut
    //
    
    CardDoc *card = [self.cards objectAtIndex:indexPath.row];
    if (![card.data checkedOut]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CardCell"];
        UILabel *nameLabel = (UILabel *) [cell viewWithTag:100];
        nameLabel.text = card.data.name;
        UILabel *typeLabel = (UILabel *) [cell viewWithTag:101];
        typeLabel.text = card.data.cardType;
        UIImageView * cardImageView = (UIImageView *) [cell viewWithTag:102];
        cardImageView.contentMode = UIViewContentModeScaleAspectFill;
        cardImageView.image = card.cardImage;

        return cell;

    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CheckedOutCell"];
        UILabel *nameLabel = (UILabel *) [cell viewWithTag:103];
        nameLabel.text = card.data.name;
        UILabel *typeLabel = (UILabel *) [cell viewWithTag:104];
        typeLabel.text = card.data.cardType;
        UIImageView * cardImageView = (UIImageView *) [cell viewWithTag:105];
        cardImageView.image = card.cardImage;
        cardImageView.contentMode = UIViewContentModeScaleAspectFill;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        return cell;
        
    }

}

// Refreshes table data

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
