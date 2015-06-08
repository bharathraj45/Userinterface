//
//  HistroyViewController.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface HistroyViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UITableView *historyTableView;

@property (nonatomic, strong) NSMutableArray *allTableData;
@property (nonatomic, weak) IBOutlet UITextField *txtStartDate;
@property (nonatomic, weak) IBOutlet UITextField *txtEndDate;
@property (nonatomic, weak) IBOutlet UIButton *btnSearch;
@property (nonatomic, weak) IBOutlet UISearchBar *searchMapView;


@property (strong, nonatomic) IBOutlet MKMapView *mapViewDatq;
@property (strong, nonatomic) CLLocationManager *locationManager;

-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;
-(IBAction)setMapType:(UISegmentedControl *)sender;

@end
