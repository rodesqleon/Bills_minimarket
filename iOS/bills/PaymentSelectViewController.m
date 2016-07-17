//
//  PaymentSelectViewController.m
//  bills
//
//  Created by Rodrigo Esquivel on 15-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//
#import "TransbankViewController.h"
#import "BillRangeViewController.h"
#import "PaymentSelectViewController.h"

@interface PaymentSelectViewController ()
@property (weak, nonatomic) IBOutlet UIButton *cashOption;
@property (weak, nonatomic) IBOutlet UIButton *transbankOption;

@end

@implementation PaymentSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"PaymentSelectView" bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
        
        
    }
    //[self loadView];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.translucent = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cashOption:(id)sender{
    BillRangeViewController *billRange = [BillRangeViewController new];
    billRange.bill_day = self.bill_day;
    billRange.bill_month = self.bill_month;
    billRange.bill_year = self.bill_year;
    [[self navigationController] pushViewController:billRange animated:YES];
}

- (IBAction)transbankOption:(id)sender{
    TransbankViewController *transbank = [TransbankViewController new];
    transbank.day = self.bill_day;
    transbank.month = self.bill_month;
    transbank.year = self.bill_year;
    [[self navigationController] pushViewController:transbank animated:YES];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
