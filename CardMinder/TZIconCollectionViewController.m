//
//  TZIconCollectionViewController.m
//  CardMinder
//
//  Created by Zach Burns on 9/27/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import "TZIconCollectionViewController.h"

@interface TZIconCollectionViewController ()
{
    NSArray *icons;
}
@end

@implementation TZIconCollectionViewController

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedIcon = [icons[indexPath.section] objectAtIndex:indexPath.row];
    
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
    
    icons = [NSArray arrayWithObjects:@"discover.png", @"mastercard.png", @"visa1.png", nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [icons count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *iconImageView = (UIImageView *)[cell viewWithTag:103];
    iconImageView.image = [UIImage imageNamed:[icons objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
