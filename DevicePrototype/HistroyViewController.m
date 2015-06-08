//
//  HistroyViewController.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "HistroyViewController.h"
#import "HistoryDateViewInformation.h"
#import "HistoryTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "Macros.h"
#import "Annotationq.h"

@interface HistroyViewController ()

@end

#define Mauritius_LATITUDE -20.1619400
#define Mauritius_LONGITUDE 57.4988900

#define Mumbai_LATITUDE 19.0728300
#define Mumbai_LONGITUDE 72.8826100

#define London_LATITUDE 51.5085300
#define London_LONGITUDE -0.1257400

#define Spain_LATITUDE 41.3887900
#define Spain_LONGITUDE 2.1589900

#define Germany_LATITUDE 52.5243700
#define Germany_LONGITUDE 13.4105300

//#define Nairobi_LATITUDE  31.9552200
//#define Nairobi_LONGITUDE 35.9450300
#define Egypt_LATITUDE  30.0626300
#define Egypt_LONGITUDE 31.2496700

#define Mascow_LATITUDE 55.7522200
#define Mascow_Longitude 37.6155600

#define Munich_Latitude 48.1374300
#define Munich_Longitude 11.5754900

#define Dublin_Latitude 53.3330600
#define Dublin_LONGITUDE -6.2488900

#define Antwerp_Latitude 51.2198900
#define Antwerp_Longitude 4.4034600

#define Cairo_Latitude 30.0626300
#define Cairo_Longitude 31.2496700


#define Paris_LATITUDE 48.8534100
#define Paris_LONGITUDE 2.3488000


#define THE_SPAN 84.07f //0.10f

@implementation HistroyViewController


@synthesize historyTableView;
@synthesize allTableData;
@synthesize txtEndDate;
@synthesize txtStartDate;
@synthesize btnSearch;
@synthesize mapViewDatq;
@synthesize locationManager;
@synthesize searchMapView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.historyTableView.layer.cornerRadius = 8.0f;
    
    [self viewDataAddedInformation];
    
    UISwipeGestureRecognizer *swipeGestureLeftData = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(eventData:)];
    swipeGestureLeftData.numberOfTouchesRequired = 1;
    swipeGestureLeftData.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGestureLeftData];
    
    UISwipeGestureRecognizer *swipeGestureRightData = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(eventDataRightInformation:)];
    swipeGestureRightData.numberOfTouchesRequired = 1;
    swipeGestureRightData.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGestureRightData];
    
    
    
//    UIImage* _backGround = [UIImage imageNamed:@"m3-1"];
//    UIImage* _backGround = [UIImage imageNamed:@"m4"];
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
//    [backgroundImage setImage:_backGround];
//    // choose best mode that works for you
//    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
//    [self.view insertSubview:backgroundImage atIndex:0];
    //self.view.backgroundColor = UIColorFromRGBWithAlpha(0xE75155, 1.0);
    self.btnSearch.backgroundColor = UIColorFromRGBWithAlpha(0xC1012F, 1.0f);
    
    self.mapViewDatq.showsUserLocation = YES;
    
    //NSLog(@"%@",self.mapView.userLocation.title);
    [self mapData];
    
    //    MKUserTrackingBarButtonItem *buttonItem = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapViewDatq];
    //    self.navigationItem.rightBarButtonItem = buttonItem;
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestureDatq:)];
    [self.mapViewDatq addGestureRecognizer:longPressGesture];
}

-(void)handleLongPressGestureDatq:(UIGestureRecognizer *)sender{
    //this is important if you only want to receive one tap and hold event
    //    if(sender.state == UIGestureRecognizerStateEnded){
    //        [self.mapViewDatq removeGestureRecognizer:sender];
    //    }
    //    else{
    //        //here we get the cgpoint for the touch location and convert it in to latitude and longitude coordinates to display on the map
    //        CGPoint point = [sender locationInView:self.mapViewDatq];
    //        CLLocationCoordinate2D locCoord = [self.mapViewDatq convertPoint:point toCoordinateFromView:self.mapViewDatq];
    //        //then all you have to do is create the annotation and add it to the map
    //        Annotationq *pinq = [[Annotationq alloc] init];
    ////        dropPin.coordinate.latitude = [NSNumber numberWithDouble:locCoord.latitude];
    ////        dropPin.coordinate.longitude = [NSNumber numberWithDouble:locCoord.longitude];
    //        pinq.title = [NSString stringWithFormat:@"WishList"];
    //        pinq.subtitle = [NSString stringWithFormat:@"Places you considered"];
    //        pinq.coordinate = locCoord;
    //
    //        [self.mapViewDatq addAnnotation:pinq];
    //
    //    }
    
    
    //here we get the cgpoint for the touch location and convert it in to latitude and longitude coordinates to display on the map
    CGPoint point = [sender locationInView:self.mapViewDatq];
    CLLocationCoordinate2D locCoord = [self.mapViewDatq convertPoint:point toCoordinateFromView:self.mapViewDatq];
    //then all you have to do is create the annotation and add it to the map
    Annotationq *pinq = [[Annotationq alloc] init];
    //        dropPin.coordinate.latitude = [NSNumber numberWithDouble:locCoord.latitude];
    //        dropPin.coordinate.longitude = [NSNumber numberWithDouble:locCoord.longitude];
    pinq.title = [NSString stringWithFormat:@"WishList"];
    pinq.subtitle = [NSString stringWithFormat:@"Places you considered"];
    pinq.coordinate = locCoord;
    
    [self.mapViewDatq addAnnotation:pinq];
    
}

-(void)mapData{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    //    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager requestWhenInUseAuthorization];
    
    //create the region
    MKCoordinateRegion myRegionDatq;
    
    //center
    CLLocationCoordinate2D center;
    center.latitude = Egypt_LATITUDE;
    center.longitude = Egypt_LONGITUDE;
    
    
    //    MKCoordinateSpan span;
    //    span.latitudeDelta=.01;
    //    span.longitudeDelta=.01;
    
    //span
    MKCoordinateSpan span;
    span.latitudeDelta = THE_SPAN;
    span.longitudeDelta = THE_SPAN;
    
    myRegionDatq.center = center;
    myRegionDatq.span = span;
    
    //set our mapview
    [self.mapViewDatq setRegion:myRegionDatq animated:YES];
    
    
    //Annotation
    NSMutableArray *locations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    Annotationq *annq;
    
    //Mauritius
    annq = [[Annotationq alloc] init];
    location.latitude = Mauritius_LATITUDE;
    location.longitude = Mauritius_LONGITUDE;
    annq.coordinate = location;
    annq.title = @"Mauritius";
//    annq.subtitle = @"World of Beaches";
    annq.subtitle = @"You have visited this place.";
    [locations addObject:annq];
    
    //Spain
    annq = [[Annotationq alloc] init];
    location.latitude = Spain_LATITUDE;
    location.longitude = Spain_LONGITUDE;
    annq.coordinate = location;
    annq.title = @"Barcelona";
    annq.subtitle = @"Smile! You are in Spain!";
    [locations addObject:annq];
    
    //London
    annq = [[Annotationq alloc] init];
    location.latitude = London_LATITUDE;
    location.longitude = London_LONGITUDE;
    annq.coordinate = location;
    annq.title = @"London";
    annq.subtitle = @"Move your imagination – Come and find your story";
    [locations addObject:annq];
    
    //France
    annq = [[Annotationq alloc] init];
    location.latitude = Paris_LATITUDE;
    location.longitude = Paris_LONGITUDE;
    annq.coordinate = location;
    annq.title = @"Paris";
    annq.subtitle = @"France";
    [locations addObject:annq];
    
    
    //Germany
    annq = [[Annotationq alloc] init];
    location.latitude = Germany_LATITUDE;
    location.longitude = Germany_LONGITUDE;
    annq.coordinate = location;
    annq.title = @"Germany";
    annq.subtitle = @"The travel destination";
    [locations addObject:annq];
    //Mumbai
    annq = [[Annotationq alloc] init];
    location.latitude = Mumbai_LATITUDE;
    location.longitude = Mumbai_LONGITUDE;
    annq.coordinate = location;
    annq.title = @"Mumbai";
    annq.subtitle = @"Incredible !ndia";
    [locations addObject:annq];
    
    //Mascow
    annq = [[Annotationq alloc] init];
    location.latitude = Mascow_LATITUDE;
    location.longitude = Mascow_Longitude;
    annq.coordinate = location;
    annq.title = @"Mascow";
    annq.subtitle = @"Russia";
    [locations addObject:annq];
    
    //Munich
    annq = [[Annotationq alloc] init];
    location.latitude = Munich_Latitude;
    location.longitude = Munich_Longitude;
    annq.coordinate = location;
    annq.title = @"Munich";
    annq.subtitle = @"Germany";
    [locations addObject:annq];
    
    //Dublin
    annq = [[Annotationq alloc] init];
    location.latitude = Dublin_Latitude;
    location.longitude = Dublin_LONGITUDE;
    annq.coordinate = location;
    annq.title = @"Dublin";
    annq.subtitle = @"Ireland";
    [locations addObject:annq];
    
    //Antwerp
    annq = [[Annotationq alloc] init];
    location.latitude = Antwerp_Latitude;
    location.longitude = Antwerp_Longitude;
    annq.coordinate = location;
    annq.title = @"Antwerp";
    annq.subtitle = @"Belgium";
    [locations addObject:annq];
    
    //Cairo
    annq = [[Annotationq alloc] init];
    location.latitude = Cairo_Latitude;
    location.longitude = Cairo_Longitude;
    annq.coordinate = location;
    annq.title = @"Cairo";
    annq.subtitle = @"Egypt";
    [locations addObject:annq];
    
    //    //Mauritius
    //    annq = [[Annotationq alloc] init];
    //    location.latitude = Mauritius_LATITUDE;
    //    location.longitude = Mauritius_LONGITUDE;
    //    annq.coordinate = location;
    //    annq.title = @"Mauritius";
    //    annq.subtitle = @"World of Beaches";
    //    [locations addObject:annq];
    
    
    
    [self.mapViewDatq addAnnotations:locations];
    
    [self drawRoute:locations];
    
    
}

- (void) drawRoute:(NSArray *) path
{
    NSInteger numberOfSteps = path.count;
    
    CLLocationCoordinate2D coordinates[numberOfSteps];
    for (NSInteger index = 0; index < numberOfSteps; index++) {
        CLLocation *location = [path objectAtIndex:index];
        CLLocationCoordinate2D coordinate = location.coordinate;
        
        coordinates[index] = coordinate;
    }
    
    MKPolyline *polyLine = [MKPolyline polylineWithCoordinates:coordinates count:numberOfSteps];
    [self.mapViewDatq addOverlay:polyLine];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.txtStartDate.layer.cornerRadius = 8.0f;
    self.txtStartDate.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtStartDate.layer.borderWidth = 1.0f;
    self.txtStartDate.layer.masksToBounds = true;
    
    self.txtEndDate.layer.cornerRadius = 8.0f;
    self.txtEndDate.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtEndDate.layer.borderWidth = 1.0f;
    self.txtEndDate.layer.masksToBounds = true;
    
    self.btnSearch.layer.cornerRadius = 8.0f;
    
}

-(void)eventData:(UISwipeGestureRecognizer *)sender{
    NSUInteger numberoftouchesdata = sender.numberOfTouches;
    if(numberoftouchesdata == 1){
        if(sender.state == UIGestureRecognizerStateEnded){
            self.tabBarController.selectedIndex = 3;
        }
    }
}

-(void)eventDataRightInformation:(UISwipeGestureRecognizer *)sender{
    NSUInteger numberoftouchesdata = sender.numberOfTouches;
    if(numberoftouchesdata == 1){
        if(sender.state == UIGestureRecognizerStateEnded){
            self.tabBarController.selectedIndex = 1;
        }
    }
}

-(void)viewDataAddedInformation{
    UIView *paddingChooseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingChooseView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"electronicdate"]];
    self.txtStartDate.rightView = paddingChooseView;
    self.txtStartDate.rightViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingDateView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingDateView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"electronicdate"]];
    self.txtEndDate.rightView = paddingDateView;
    self.txtEndDate.rightViewMode = UITextFieldViewModeAlways;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    [self getDisplayData];
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [allTableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"cellIdentifier";
    
    HistoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[HistoryTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        //you can customize your cell here because it will be used just for one row.
    }
    
    HistoryDateViewInformation *product;
    
    product = [allTableData objectAtIndex:indexPath.row];
    
    cell.lblDate.text = [NSString stringWithFormat:@"%@", product.strDate];
    cell.lblFare.text = [NSString stringWithFormat:@"%@", product.strFare];
    cell.lblFromCity.text = [NSString stringWithFormat:@"%@", product.strFromCity];
    cell.lblToCity.text = [NSString stringWithFormat:@"%@", product.strToCity];
    cell.separatorInset = UIEdgeInsetsZero;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


-(void)viewDidLayoutSubviews
{
    if ([self.historyTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.historyTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.historyTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.historyTableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)getDisplayData{
    allTableData = [[NSMutableArray alloc] init];
    
    HistoryDateViewInformation *product;
    //    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    //
    //    NSInteger day = [components day];
    //    NSInteger month = [components month];
    //    NSInteger year = [components year];
    //NSString *strq = [components ]
    
    //    NSDateComponents *components = [[NSCalendar currentCalendar]
    //                                    components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit
    //                                    fromDate:[NSDate date]];
    //    NSDate *startDate = [[NSCalendar currentCalendar]
    //                         dateFromComponents:components];
    //NSString *strq = [NSString stringWithFormat:@"%ld %ld %ld", (long)day, (long)month, (long)year];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd-MM-yyyy";
    NSString *strq = [formatter stringFromDate:[NSDate date]];
    
    for(int i =0; i < 5; i++){
        if(i ==0){
            product = [[HistoryDateViewInformation alloc] initWithManufacturer:[NSString stringWithFormat:@"%@", strq] andFare:@"12000.00" andFromCity:@"Mauritius" andToCity:@"London"];
        }
        else if(i ==1){
            product = [[HistoryDateViewInformation alloc] initWithManufacturer:[NSString stringWithFormat:@"%@", strq] andFare:@"23400.00" andFromCity:@"Mauritius" andToCity:@"Spain"];
        }
        else if(i == 2){
            product = [[HistoryDateViewInformation alloc] initWithManufacturer:[NSString stringWithFormat:@"%@", strq] andFare:@"34680.00" andFromCity:@"Mauritius" andToCity:@"Malaysia"];
        }
        else if(i == 3){
            product = [[HistoryDateViewInformation alloc] initWithManufacturer:[NSString stringWithFormat:@"%@", strq] andFare:@"48000.00" andFromCity:@"Mauritius" andToCity:@"Jonhnesburg"];
        }
        else{
            product = [[HistoryDateViewInformation alloc] initWithManufacturer:[NSString stringWithFormat:@"%@", strq] andFare:@"16000.00" andFromCity:@"Mauritius" andToCity:@"Harare"];
        }
        
        [allTableData addObject:product];
    }
    
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    NSString *strDateInformationString = [NSString stringWithFormat:@"History Data Information for User"];
//    return strDateInformationString;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height = 40.0f;
    
    return height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width,tableView.bounds.size.height)];
    [headerView setBackgroundColor: UIColorFromRGBWithAlpha(0xC1012F, 1.0)];
    UILabel *titleForHeader = [[UILabel alloc] initWithFrame:CGRectMake(4,0,243,40)];
    titleForHeader.textAlignment = NSTextAlignmentLeft;
    //titleForHeader.backgroundColor=[UIColor clearColor];
    titleForHeader.textColor = [UIColor whiteColor];
    titleForHeader.font = [UIFont boldSystemFontOfSize:17];
    titleForHeader.text = [NSString stringWithFormat:@"History for the user"];
    [headerView addSubview:titleForHeader];
    
    return headerView;
    
    
    
}

#pragma - Mapkit protocol methods

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    //MKCoordinateRegion *region = MKCoordinateForMapPoint(userLocation.coordinate, 800, 800);
    //MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    //[self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    //self.mapView.centerCoordinate = userLocation.location.coordinate;
    //NSLog(@"%@", userLocation);
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views{
    // NSLog(@"%@", views);
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    //    NSLog(@"firstq");
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"This is a test" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //    [alert show];
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    //NSLog(@"firstqqq");
    //NSLog(@"%@ q %@", view, control);
    //NSLog(@"%@", view.annotation);
    //NSLog(@"%@",[view.annotation title]);
    //[self displayToInformation];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"This is a test" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)displayToInformation{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Home" bundle:nil];
    
    //UIViewController *sbvc = [sb instantiateViewControllerWithIdentifier:@"firstdata"];
    UIViewController *sbvc = [sb instantiateInitialViewController];
    sbvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:sbvc animated:YES completion:nil];
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //NSLog(@"%@", annotation);
    if([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    static NSString *cellIndq = @"cellIdentifierDatq";
    MKAnnotationView *pinq = nil;
    //MKPinAnnotationView *pinq = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:cellIndq];
    //MKAnnotationView *vieq = [[MKAnnotationView alloc] init];
    //return vieq;
    
    if(!pinq){
        pinq = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:cellIndq];
        pinq.canShowCallout = YES;
        if([[annotation title] isEqualToString:@"Mauritius"] || [[annotation title] isEqualToString:@"Barcelona"] || [[annotation title] isEqualToString:@"London"]|| [[annotation title] isEqualToString:@"Germany"] || [[annotation title] isEqualToString:@"Mumbai"] || [[annotation title] isEqualToString:@"Paris"]){
            //pinq.pinColor = MKPinAnnotationColorGreen;
            pinq.image = [UIImage imageNamed:@"pgreyq4"];
            
            //pinq.opaque = YES;
            pinq.calloutOffset = CGPointMake(0,4);
            pinq.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
        else if([[annotation title] isEqualToString:@"WishList"]){
            pinq.image = [UIImage imageNamed:@"pblueq"];
            
            //pinq.opaque = YES;
            pinq.calloutOffset = CGPointMake(0,4);
            pinq.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            
        }
        else{
            //pinq.pinColor = MKPinAnnotationColorPurple; //(MKPinAnnotationColor)[UIColor blueColor];
            //pinq.pinColor = MKPinAnnotationColorPurple;
            //pinq.backgroundColor = [UIColor yellowColor];
            //            pinq.image = [UIImage imageNamed:@"pblue"];
            pinq.image = [UIImage imageNamed:@"pgreenq"];
            //pinq.opaque = YES;
            pinq.calloutOffset = CGPointMake(0,4);
            pinq.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        }
        //        pinq.pinColor = MKPinAnnotationColorGreen;
        //pinq.animatesDrop = YES;
    }
    
    //    MKPinAnnotationView *pinq = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:cellIndq];
    //    //MKAnnotationView *vieq = [[MKAnnotationView alloc] init];
    //    //return vieq;
    //
    //    if(!pinq){
    //        pinq = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:cellIndq];
    //        pinq.canShowCallout = YES;
    //        if([[annotation title] isEqualToString:@"Mauritius"] || [[annotation title] isEqualToString:@"Spain"] || [[annotation title] isEqualToString:@"London"]|| [[annotation title] isEqualToString:@"Germany"] || [[annotation title] isEqualToString:@"Mumbai"]){
    //            pinq.pinColor = MKPinAnnotationColorGreen;
    //            pinq.image = [UIImage imageNamed:@"Select"];
    //            pinq.opaque = NO;
    //        }
    //        else{
    //            //pinq.pinColor = MKPinAnnotationColorPurple; //(MKPinAnnotationColor)[UIColor blueColor];
    //            pinq.pinColor = MKPinAnnotationColorPurple;
    //            //pinq.backgroundColor = [UIColor yellowColor];
    //            pinq.image = [UIImage imageNamed:@"Select"];
    //            pinq.opaque = NO;
    //        }
    ////        pinq.pinColor = MKPinAnnotationColorGreen;
    //        pinq.animatesDrop = YES;
    //    }
    return pinq;
}


-(IBAction)setMapType:(UISegmentedControl *)sender;{
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapViewDatq.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapViewDatq.mapType = MKMapTypeSatellite;
            break;
        case 2:
            self.mapViewDatq.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    //    NSLog(@"%@", [overlay title]);
    //    if([[overlay title] isEqualToString:@"Mauritius"]){
    //        NSLog(@"%@", [overlay title]);
    //    }
    // NSLog(@"%@",)
    //    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    //
    //    CLLocationCoordinate2D center;
    //    center.latitude = Mumbai_LATITUDE;
    //    center.longitude = Mumbai_LONGITUDE;
    //    MKPlacemark *place = [[MKPlacemark alloc]
    //                          initWithCoordinate:center
    //                          addressDictionary:nil];
    //
    //    MKMapItem *mapItem =
    //    [[MKMapItem alloc]initWithPlacemark:place];
    //
    //    [request setSource:[MKMapItem mapItemForCurrentLocation]];
    //    [request setDestination:mapItem];
    //    [request setTransportType:MKDirectionsTransportTypeAny]; // This can be limited to automobile and walking directions.
    //    [request setRequestsAlternateRoutes:YES]; // Gives you several route options.
    //    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    //    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
    //        if (!error) {
    ////            for (MKRoute *route in [response routes]) {
    ////                [self.mapView addOverlay:[route polyline] level:MKOverlayLevelAboveRoads]; // Draws the route above roads, but below labels.
    ////                // You can also get turn-by-turn steps, distance, advisory notices, ETA, etc by accessing various route properties.
    ////            }
    //            [self showRoute:response];
    //        }
    //        else{
    //            NSLog(@"%@", error);
    //        }
    //    }];
    
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        //        MKPolyline *route = overlay;
        //        MKPolylineRenderer *routeRenderer = [[MKPolylineRenderer alloc] initWithPolyline:route];
        //        routeRenderer.strokeColor = [UIColor blueColor];
        //        routeRenderer.lineWidth = 4.3f;
        //        routeRenderer.fillColor = [UIColor yellowColor];
        //        return routeRenderer;
        return  nil;
    }
    else{
        return nil;
    }
}
-(void)showRoute:(MKDirectionsResponse *)response
{
    for (MKRoute *route in response.routes)
    {
        [self.mapViewDatq
         addOverlay:route.polyline level:MKOverlayLevelAboveRoads];
    }
}


#pragma - search bar delegate methods

//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
//    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
//    
//    [geoCoder geocodeAddressString:searchBar.text completionHandler:^(NSArray *placemarks, NSError *error) {
//        
//        if(!error){
//            CLPlacemark *placemark = [placemarks objectAtIndex:0];
//            MKCoordinateRegion region;
//            region.center.latitude = placemark.region.center.latitude;
//            region.center.longitude = placemark.region.center.longitude;
//            MKCoordinateSpan span;
//            double radius = placemark.region.radius/1000; //convert to kilometers
//            
//            NSLog(@"search bar button clicked %f", radius);
//            span.latitudeDelta = radius/112.0;
//            region.span = span;
//            [self.mapViewDatq setRegion:region animated:YES];
//        }
//        else{
//            
//        }
//    }];
//}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder geocodeAddressString:searchBar.text completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if(!error){
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            
            
            MKCoordinateRegion region;
            region.center = [(CLCircularRegion *)placemark.region center];
//            region.center.latitude = placemark.region.center.latitude;
//            region.center.longitude = placemark.region.center.longitude;
            MKCoordinateSpan span;
            double radius = [(CLCircularRegion *)placemark.region radius]/1000; //convert to kilometers
            
            //NSLog(@"search bar button clicked %f", radius);
            span.latitudeDelta = radius/112.0;
            region.span = span;
//            MKPlacemark *placemarkm = [[MKPlacemark alloc] initWithPlacemark:placemark];//[placemarks objectAtIndex:0];
//            [self.mapViewDatq addAnnotation:placemarkm];
            
            [self.mapViewDatq setRegion:region animated:YES];
        }
        else{
            
        }
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.mapViewDatq endEditing: YES];
    [self.searchMapView resignFirstResponder];
}
@end
