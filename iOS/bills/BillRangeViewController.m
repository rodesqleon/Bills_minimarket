//
//  BillRangeViewController.m
//  bills
//
//  Created by Rodrigo Esquivel on 16-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//

#import "BillRangeViewController.h"
#import "BillViewController.h"
@interface BillRangeViewController ()

@end

@implementation BillRangeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"BillRangeView" bundle:nibBundleOrNil];
    
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
    self.initialBill_txtField.delegate = self;
    self.endBill_txtField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.initialBill_txtField) {
        [theTextField resignFirstResponder];
    }
    
    return YES;
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
    UIBarButtonItem *finish = [[UIBarButtonItem alloc] initWithTitle:@"Siguiente" style:UIBarButtonItemStylePlain target:self
                                                              action:@selector(finish)];
    finish.tintColor = [UIColor blueColor];
    [[self navigationItem] setRightBarButtonItem:finish];
    [[self view] endEditing:YES];
}

- (void)finish{
    NSCharacterSet * set = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
    if([self.initialBill_txtField.text isEqualToString:self.endBill_txtField.text] || ([self.initialBill_txtField.text intValue] > [self.endBill_txtField.text intValue]) ){
        [self showMessage:@"El Nº Boleta de inicio debe ser menor al Nº Boleta termino"
                withTitle:@"Error"];
        
    }else if (([self.initialBill_txtField.text rangeOfCharacterFromSet:set].location != NSNotFound || ([self.initialBill_txtField.text isEqualToString:@""] || [self.endBill_txtField.text isEqualToString:@""]))){
        [self showMessage:@"Ingresa solo números"
                withTitle:@"Error"];
    }else{
        BillViewController *billView = [BillViewController new];
        billView.day = self.bill_day;
        billView.month = self.bill_month;
        billView.year = self.bill_year;
        billView.initial_bill = [self.initialBill_txtField.text intValue];
        billView.initial_bill_static = [self.initialBill_txtField.text intValue];
        billView.end_bill = [self.endBill_txtField.text intValue];
        [[self navigationController] pushViewController:billView animated:YES];
    }

}

-(void)showMessage:(NSString*)message withTitle:(NSString *)title
{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        //do something when click button
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    UIBarButtonItem *finish = [[UIBarButtonItem alloc] initWithTitle:@"Siguiente" style:UIBarButtonItemStylePlain target:self
                                                              action:@selector(finish)];
    finish.tintColor = [UIColor blueColor];
    [[self navigationItem] setRightBarButtonItem:finish];

    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
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
