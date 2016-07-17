//
//  DateSelectViewController.h
//  bills
//
//  Created by Rodrigo Esquivel on 14-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateSelectViewController : UIViewController

@property (nonatomic) UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *inputDate;

@end
