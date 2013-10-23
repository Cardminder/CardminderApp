//
//  TZAppDelegate.m
//  CardMinder
//
//  Created by Zach Burns on 9/23/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import "TZAppDelegate.h"
#import "CardData.h"
#import "CardDoc.h"
#import "CardDatabase.h"
#import "CardViewController.h"

@implementation TZAppDelegate {
    //NSMutableArray *cards;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    NSMutableArray *loadedCards = [CardDatabase loadCardDocs];
    UINavigationController *navigationController = (UINavigationController *) self.window.rootViewController;
    CardViewController *cardViewController = [[navigationController viewControllers] objectAtIndex:0];
    cardViewController.cards = loadedCards;
    
    
    //cards = [NSMutableArray arrayWithCapacity:50];
    /*Card *card = [[Card alloc] init];
    card.name = @"Credit Card";
    card.cardType = @"Discover";
    //card.icon = @"discover.png";
    [cards addObject:card];
    Card *card1 = [[Card alloc]init];
    card1.name = @"Debit Card";
    card1.cardType = @"Visa";
    //card1.icon = 1;
    [cards addObject:card1];
    Card *card2 = [[Card alloc]init];
    card2.name = @"Credit Card";
    card2.cardType = @"Mastercard";
    //card2.icon = 3;
    [cards addObject:card2];*/
    
    /*UINavigationController *navigationController = (UINavigationController *) self.window.rootViewController;
    CardViewController *cardViewController = [[navigationController viewControllers] objectAtIndex:0];
    cardViewController.cards = cards;*/
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
