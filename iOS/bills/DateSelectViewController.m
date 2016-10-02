//
//  DateSelectViewController.m
//  bills
//
//  Created by Rodrigo Esquivel on 14-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//

#import "DateSelectViewController.h"
#import "PaymentSelectViewController.h"

@interface DateSelectViewController ()

@end

@implementation DateSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"DateSelectView" bundle:nibBundleOrNil];
    
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
    [self.navigationController.navigationBar.backItem setTitle:@"Volver"];
    self.datePicker = [UIDatePicker new];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.inputDate setInputView:self.datePicker];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Listo" style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(doneEditing)];
    doneButton.tintColor = [UIColor blueColor];
    [[self navigationItem] setRightBarButtonItem:doneButton];
}



- (void)doneEditing {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"d/M/yyyy"];
    self.inputDate.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:self.datePicker.date]];
    self.inputDate.textColor = [UIColor blueColor];
    [self.inputDate resignFirstResponder];
    UIBarButtonItem *finish = [[UIBarButtonItem alloc] initWithTitle:@"Siguiente" style:UIBarButtonItemStylePlain target:self
                                                              action:@selector(finish)];
    finish.tintColor = [UIColor blueColor];
    [[self navigationItem] setRightBarButtonItem:finish];
    [[self view] endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.inputDate) {
        [theTextField resignFirstResponder];
    }
    
    return YES;
}

- (void)finish{
    NSArray *array = [self.inputDate.text componentsSeparatedByString:@"/"];
    
    PaymentSelectViewController *paymentSelect = [PaymentSelectViewController new];
    paymentSelect.bill_day = array[0];
    paymentSelect.bill_month = array[1];
    paymentSelect.bill_year = array[2];
    [[self navigationController] pushViewController:paymentSelect animated:YES];
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

@end
