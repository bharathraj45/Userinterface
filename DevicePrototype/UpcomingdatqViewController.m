//
//  UpcomingdatqViewController.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 29/05/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "UpcomingdatqViewController.h"
#import "OffersDataDetail.h"
#import "OffersTableViewCell.h"
#import "Macros.h"

@interface UpcomingdatqViewController ()

@end

@implementation UpcomingdatqViewController
@synthesize offersTableViewData;
@synthesize allTableDataOffers;
@synthesize imageData;
@synthesize lblDate;
@synthesize navigationData;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(btnBacktapevent:)];
    [self displayDatq];
    UISwipeGestureRecognizer *swipeGestureLeftData = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(eventData:)];
    swipeGestureLeftData.numberOfTouchesRequired = 1;
    swipeGestureLeftData.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGestureLeftData];
    
    UISwipeGestureRecognizer *swipeGestureRightData = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(eventDataRightData:)];
    swipeGestureRightData.numberOfTouchesRequired = 1;
    swipeGestureRightData.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGestureRightData];
}


-(void)eventData:(UISwipeGestureRecognizer *)sender{
    NSUInteger numberoftouchesdata = sender.numberOfTouches;
    if(numberoftouchesdata == 1){
        if(sender.state == UIGestureRecognizerStateEnded){
            self.tabBarController.selectedIndex = 4;
        }
    }
}

-(void)eventDataRightData:(UISwipeGestureRecognizer *)sender{
    NSUInteger numberoftouchesdata = sender.numberOfTouches;
    if(numberoftouchesdata == 1){
        if(sender.state == UIGestureRecognizerStateEnded){
            self.tabBarController.selectedIndex = 2;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayDatq{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"EEEE"];
    [dateFormatter setDateFormat:@"dd MMMM YYYY EEEE"];
    NSDate *now4 = [NSDate date];
    int daysToAdd4 = 4;
    NSDate *newDate1 = [now4 dateByAddingTimeInterval:60*60*24*daysToAdd4];
    NSString *end = [dateFormatter stringFromDate:newDate1];
    //NSLog(@"%@", [dateFormatter stringFromDate:newDate1]);
    self.lblDate.text = [NSString stringWithFormat:@"%@",end];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    NSString *str = [NSString stringWithFormat:@"Trip tools"];
//    return str;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width,tableView.bounds.size.height)];
    [headerView setBackgroundColor: UIColorFromRGBWithAlpha(0x37B247, 1.0)];
    UILabel *titleForHeader = [[UILabel alloc] initWithFrame:CGRectMake(10,0,243,40)];
    titleForHeader.textAlignment = NSTextAlignmentLeft;
    //titleForHeader.backgroundColor=[UIColor clearColor];
    titleForHeader.textColor = [UIColor whiteColor];
    titleForHeader.font = [UIFont boldSystemFontOfSize:17];
    titleForHeader.text = [NSString stringWithFormat:@"Trip Tools"];
    [headerView addSubview:titleForHeader];
    
    return headerView;
    
    
}




-(void)showDataForOffers{
    //    /https://itunes.apple.com/nz/app/fcm-mobile/id638232499?mt=8
    allTableDataOffers = [[NSMutableArray alloc] init];
    
    NSInteger i = 0;
    OffersDataDetail *offersData;
    while (i < 3) {
        if(i ==0){
            offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Where are you James?" andDescription:@"Report your Position" andDuration:@"Let us know where you are" andImageDescription:@"ulocationdatq" andImageSelectionStatus:@"righ"];
        }
        else if(i ==1){
            offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Airport guide" andDescription:@"Auckland" andDuration:@"Shops, cafes, useful numbers" andImageDescription:@"udirectiondatq" andImageSelectionStatus:@"righ"];
        }
        else if(i == 2){
            
            offersData = [[OffersDataDetail alloc] initWithManufacturerData:@"Weather in Christchurch" andDescription:[NSString stringWithFormat:@"18%@C (64%@F) Chance of rain", @"\u00B0", @"\u00B0"] andDuration:@"View next 4 days" andImageDescription:@"uweatherdatq" andImageSelectionStatus:@"righ"];
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
    //[self.offersTableViewData performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
    //[self.offersTableViewData performSelectorInBackground:@selector(reloadData:) withObject:nil];
}

-(IBAction)btnBacktapevent:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
