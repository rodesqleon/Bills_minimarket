//
//  ExportViewController.m
//  bills
//
//  Created by Rodrigo Esquivel on 16-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//
#import "DateSelectViewController.h"
#import "ExportViewController.h"

@interface ExportViewController ()

@end

@implementation ExportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)export:(id)sender{
    if([self.type isEqualToString:@"Efectivo"]){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://always420.cl/xlsFile.php"]];
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://always420.cl/xlsFileTransbank.php"]];
    }
}

- (IBAction)startAgain:(id)sender{
    DateSelectViewController *dataPicker = [DateSelectViewController new];
    [[self navigationController] pushViewController:dataPicker animated:YES];

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
