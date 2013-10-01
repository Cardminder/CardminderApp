//
//  TZIconTableViewController.m
//  CardMinder
//
//  Created by Zach Burns on 9/29/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import "TZIconTableViewController.h"
#import "TZAddCardViewController.h"
#import "Icon.h"

@interface TZIconTableViewController ()

@end

@implementation TZIconTableViewController {
   
}

@synthesize premadeIcons;
@synthesize premadeIconView;
@synthesize premadeIconName;
@synthesize chosenIcon;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    premadeIcons = [[NSMutableArray alloc] init];
    
    Icon *newIcon = [[Icon alloc] init];
    newIcon.iconName = @"Discover";
    newIcon.iconImageNumber = 1;
    [premadeIcons addObject:newIcon];
    Icon *newIcon1 = [[Icon alloc] init];
    newIcon1.iconName = @"Visa";
    newIcon1.iconImageNumber = 2;
    [premadeIcons addObject:newIcon1];
    Icon *newIcon2 = [[Icon alloc] init];
    newIcon2.iconName = @"Mastercard";
    newIcon2.iconImageNumber = 3;
    [premadeIcons addObject:newIcon2];
    
    
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
    return [premadeIcons count];
}

- (UIImage *)imageForIcon:(int)iconName
{
    switch (iconName) {
        case 1:
            return [UIImage imageNamed:@"discover.png"];
        case 2:
            return [UIImage imageNamed:@"visa1.png"];
        case 3:
            return [UIImage imageNamed:@"mastercard.png"];
            
    }
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IconCell"];
    Icon *icon = [self.premadeIcons objectAtIndex:indexPath.row];
    UILabel *iconLabel = (UILabel *) [cell viewWithTag:105];
    iconLabel.text = icon.iconName;
    UIImageView * iconImageView = (UIImageView *) [cell viewWithTag:106];
    iconImageView.image =  [self imageForIcon:icon.iconImageNumber];
    
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    chosenIcon = cell.imageView.image;
    
    
    
    
}

- (IBAction)savePremadeIcon:(id)sender
{
    Icon *icon = [[Icon alloc] init];
    icon.iconName = @"Nothing";
    icon.iconImage = chosenIcon;
    icon.iconImageNumber = 0;
    
    
    TZAddCardViewController *addCardViewController = (TZAddCardViewController *)[self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    
    
    [addCardViewController.iconArray addObject:icon];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
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
