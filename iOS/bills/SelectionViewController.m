//
//  SelectionViewController.m
//  bills
//
//  Created by Rodrigo Esquivel on 24-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//
#import "PurchasesViewController.h"
#import "SelectionViewController.h"
#import "DateSelectViewController.h"
@interface SelectionViewController ()

@end

@implementation SelectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"SelectionView" bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)purchases:(id)sender{
    PurchasesViewController *purchaseVC = [PurchasesViewController new];
    [[self navigationController] pushViewController:purchaseVC animated:YES];
}

-(IBAction)sells:(id)sender{
    DateSelectViewController *dateVC =  [DateSelectViewController new];
    [[self navigationController] pushViewController:dateVC animated:YES];
}

@end
