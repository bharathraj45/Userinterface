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
@synthesize lblKualaLumpur;
@synthesize lblSydney;
@synthesize lblKualaLumpurSubsubtitle;
@synthesize lblKualaLumpurSubtitle;
@synthesize lblSydneySubsubtitle;
@synthesize lblSydneySubtitle;
@synthesize viewKualaLumpur;
@synthesize viewSyndey;





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
//    UIImage* _backGround = [UIImage imageNamed:@"m3-1"];
//    UIImage* _backGround = [UIImage imageNamed:@"m4"];
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
//    [backgroundImage setImage:_backGround];
//    // choose best mode that works for you
//    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
//    [self.view insertSubview:backgroundImage atIndex:0];
    
    self.offersTableViewData.layer.cornerRadius = 2.0f;
    //self.view.backgroundColor = [UIColor blackColor];
    [self setDisplayInformationData];
    
}

-(void)setDisplayInformationData{
    lblKualaLumpur.text = @"Air Mauritius is offering you., Yes James, only you have an awesome deal!. Now book a trip to Kuala Lumpur before 31st May at a throw-away price of MURs, 20,500/-";
    lblKualaLumpurSubtitle.text = @"This is our way of saying thank you for being a loyal customer!";
    lblKualaLumpurSubsubtitle.text = @"Now go! Grab the deal before it too late!";
    
    lblSydney.text = @"Look’s like the party is on in Sydney!. You wouldn’t want to miss-out on all the fun, would you?";
    lblSydneySubtitle.text = @"Here’s a steal deal just for you James., book a flight to Sydney with Air Mauritius and get 20% off on your flight back!";
    lblSydneySubsubtitle.text = @"That’s a deal not worth skipping., join the party now!";
//    UIImage* _backGround = [UIImage imageNamed:@"kualalumpur"];
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
//    [backgroundImage setImage:_backGround];
//    // choose best mode that works for you
//    [backgroundImage setContentMode:UIViewContentModeScaleToFill];
//    [self.viewKualaLumpur insertSubview:backgroundImage atIndex:0];
    UIColor *background = [UIColor colorWithPatternImage:[UIImage imageNamed:@"kualalumpur"]];
    self.viewKualaLumpur.backgroundColor = background;
    
//    UIImage* _backGround2 = [UIImage imageNamed:@"Sydney"];
//    UIImageView *backgroundImage2 = [[UIImageView alloc] initWithFrame:self.view.frame];
//    [backgroundImage2 setImage:_backGround2];
//    // choose best mode that works for you
//    [backgroundImage2 setContentMode:UIViewContentModeScaleAspectFill];
//    [self.viewSyndey insertSubview:backgroundImage2 atIndex:0];
    
    UIColor *background2 = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Sydney"]];
    self.viewSyndey.backgroundColor = background2;
    
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
//    /https://itunes.apple.com/nz/app/fcm-mobile/id638232499?mt=8
    allTableDataOffers = [[NSMutableArray alloc] init];
    
    NSInteger i = 0;
    OffersDataDetail *offersData;
    while (i < 3) {
        if(i ==0){
            offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Where are you Maryjane?" andDescription:@"Report your Position" andDuration:@"Let us know where you are" andImageDescription:@"Imauritius" andImageSelectionStatus:@"righ"];
        }
        else if(i ==1){
           offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Airport guide" andDescription:@"Auckland" andDuration:@"Shops, cafes, useful numbers" andImageDescription:@"Ilondon" andImageSelectionStatus:@"righ"];
        }
        else if(i == 2){
            
             offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Whether in Christchurch" andDescription:@"18C (64F) Chance of rain" andDuration:@"View next 4 days" andImageDescription:@"Ilondon" andImageSelectionStatus:@"righ"];
        }
        else if(i == 3){
            offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Newyork - The city that never sleeps" andDescription:@"New York, the largest city in the U.S., is an architectural marvel with plenty of historic monuments, magnificent buildings and countless dazzling skyscrapers." andDuration:@"8 days left" andImageDescription:@"Inewyork" andImageSelectionStatus:@"righ"];
        }
        else{
            offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Paris - The city of light" andDescription:@"Paris is the city of love, inspiration, art and fashion. The night scene, the Eiffel tower and the warm atmosphere will make you feel directly at home. A trip to Paris is the perfect get-away." andDuration:@"10 days left" andImageDescription:@"Iparis" andImageSelectionStatus:@"righ"];
        }
        
        [allTableDataOffers addObject:offersData];
        i++;
    }
}

@end
