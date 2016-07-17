//
//  TransbankViewController.h
//  bills
//
//  Created by Rodrigo Esquivel on 16-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransbankViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *billNumber_txtField;
@property (weak, nonatomic) IBOutlet UITextField *billValue_txtField;
@property (weak, nonatomic) IBOutlet UITableView *billTableView;
@property (nonatomic) int initial_bill;
@property (nonatomic) NSString* day;
@property (nonatomic) NSString* month;
@property (nonatomic) NSString* year;
@end
