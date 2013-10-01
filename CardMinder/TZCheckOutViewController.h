//
//  TZCheckOutViewController.h
//  CardMinder
//
//  Created by Zach Burns on 9/30/13.
//  Copyright (c) 2013 Burnspur. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface TZCheckOutViewController : UIViewController <CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UIButton *checkOut;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableArray *geoFences;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
