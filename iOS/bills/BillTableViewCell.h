//
//  BillTableViewCell.h
//  bills
//
//  Created by Rodrigo Esquivel on 16-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dayLbl;
@property (weak, nonatomic) IBOutlet UILabel *billNumberLbl;
@property (weak, nonatomic) IBOutlet UILabel *billValueLbl;
@end
