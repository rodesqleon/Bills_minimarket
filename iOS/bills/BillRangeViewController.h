//
//  BillRangeViewController.h
//  bills
//
//  Created by Rodrigo Esquivel on 16-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillRangeViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *initialBill_txtField;
@property (weak, nonatomic) IBOutlet UITextField *endBill_txtField;

@property (nonatomic) NSString *bill_day;
@property (nonatomic) NSString *bill_month;
@property (nonatomic) NSString *bill_year;

@end
