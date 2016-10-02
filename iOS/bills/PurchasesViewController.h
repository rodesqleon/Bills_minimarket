//
//  PurchasesViewController.h
//  bills
//
//  Created by Rodrigo Esquivel on 24-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchasesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *date_txtField;
@property (weak, nonatomic) IBOutlet UITextField *receiptNumber_txtField;
@property (weak, nonatomic) IBOutlet UITextField *supplierName_txtField;
@property (weak, nonatomic) IBOutlet UITextField *supplierIdentifier_txtField;
@property (weak, nonatomic) IBOutlet UITextField *chargeAccount_txtField;
@property (weak, nonatomic) IBOutlet UITextField *totalValue_txtField;
@property (weak, nonatomic) IBOutlet UILabel *ivaValue_label;
@property (weak, nonatomic) IBOutlet UILabel *totalValue_label;
@property (weak, nonatomic) IBOutlet UITextField *observation_txtField;

@end
