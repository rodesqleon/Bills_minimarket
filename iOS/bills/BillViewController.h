//
//  BillViewController.h
//  bills
//
//  Created by Rodrigo Esquivel on 16-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *billNumber_txtField;
@property (weak, nonatomic) IBOutlet UITextField *billValue_txtField;
@property (weak, nonatomic) IBOutlet UITableView *billTableView;
@property (nonatomic) NSString* day;
@property (nonatomic) int initial_bill;
@property (nonatomic) int end_bill;
@property (nonatomic) int initial_bill_static;
@property (nonatomic) NSString* month;
@property (nonatomic) NSString* year;


@end
