//
//  OffersViewController.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "OffersViewController.h"
#import "Macros.h"
#import "DemoSingleton.h"
#import "OffersTableViewCell.h"
#import "OffersDataDetail.h"

@interface OffersViewController ()

@end

@implementation OffersViewController

@synthesize offersTableViewData;
@synthesize allTableDataOffers;





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UISwipeGestureRecognizer *swipeGestureLeftData = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(eventData:)];
    swipeGestureLeftData.numberOfTouchesRequired = 1;
    swipeGestureLeftData.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGestureLeftData];
    
    UISwipeGestureRecognizer *swipeGestureRightData = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(eventDataRightInformation:)];
    swipeGestureRightData.numberOfTouchesRequired = 1;
    swipeGestureRightData.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGestureRightData];
    
    
    //self.view.backgroundColor = UIColorFromRGBWithAlpha(0xE75155, 1.0);
    UIImage* _backGround = [UIImage imageNamed:@"m3-1"];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    [backgroundImage setImage:_backGround];
    // choose best mode that works for you
    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.view insertSubview:backgroundImage atIndex:0];
    
    self.offersTableViewData.layer.cornerRadius = 8.0f;
    
}

//-(void)viewDidAppear:(BOOL)animated{
//    NSLog(@"viewdidappear");
//}

-(void)eventData:(UISwipeGestureRecognizer *)sender{
    NSUInteger numberoftouchesdata = sender.numberOfTouches;
    if(numberoftouchesdata == 1){
        if(sender.state == UIGestureRecognizerStateEnded){
            self.tabBarController.selectedIndex = 1;
        }
    }
}

-(void)eventDataRightInformation:(UISwipeGestureRecognizer *)sender{
    NSUInteger numberoftouchesdata = sender.numberOfTouches;
    if(numberoftouchesdata == 1){
        if(sender.state == UIGestureRecognizerStateEnded){
            self.tabBarController.selectedIndex = 0;
        }
    }
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    DemoSingleton *demoSingleton = [DemoSingleton sharedInstance];
    self.tabBarController.selectedIndex = demoSingleton.selectedIndexForDisplay;
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

#pragma - table view delegate methods datq

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    [self showDataForOffers];
    return  1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return 4;
    NSInteger row = [allTableDataOffers count];
    return row;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifierOffersData";//[NSString stringWithFormat:@""];
    OffersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[OffersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    OffersDataDetail *offersData;
    offersData = [allTableDataOffers objectAtIndex:indexPath.row];
    cell.lblSubject.text = offersData.strSubject;
    cell.lblDescription.text = offersData.strDescription;
    cell.lblDuration.text = offersData.strDuration;
    cell.imgDescription.image = [UIImage imageNamed:offersData.strImageDescritpion];
    cell.imgSelectionStatusData.image = [UIImage imageNamed:offersData.strImageSelectionStatus];
    
    return cell;
}

-(void)showDataForOffers{
    
    allTableDataOffers = [[NSMutableArray alloc] init];
    
    int i = 0;
    OffersDataDetail *offersData;
    while (i < 7) {
        if(i ==0){
            offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Port Louis - World of Beaches" andDescription:@"An island with hidden natural jewels and picture perfect vistas, Mauritius is truly an exotic destination. Discover the magical land of Mauritius like never before." andDuration:@"3 days left" andImageDescription:@"Imauritius" andImageSelectionStatus:@"Add"];
        }
        else if(i ==1){
           offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"London - Move your imagination" andDescription:@"The capital city of London is simply a dream destination for sightseers, and within almost every district there are some exceptional tourist attractions to savour." andDuration:@"4 days left" andImageDescription:@"Ilondon" andImageSelectionStatus:@"Select"];
        }
        else if(i == 2){
            offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Berlin - The travel destination" andDescription:@"Berlin tends to be gray and cold; it can be warm and beautiful in summer but there's no guarantee, so it's best to always pack a jacket." andDuration:@"7 days left" andImageDescription:@"Iberlin" andImageSelectionStatus:@"Add"];
        }
        else if(i == 3){
            offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Newyork - The city that never sleeps" andDescription:@"New York, the largest city in the U.S., is an architectural marvel with plenty of historic monuments, magnificent buildings and countless dazzling skyscrapers." andDuration:@"8 days left" andImageDescription:@"Inewyork" andImageSelectionStatus:@"Select"];
        }
        else{
            offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Paris - The city of light" andDescription:@"Paris is the city of love, inspiration, art and fashion. The night scene, the Eiffel tower and the warm atmosphere will make you feel directly at home. A trip to Paris is the perfect get-away." andDuration:@"10 days left" andImageDescription:@"Iparis" andImageSelectionStatus:@"Select"];
        }
        
        [allTableDataOffers addObject:offersData];
        i++;
    }
}

@end
