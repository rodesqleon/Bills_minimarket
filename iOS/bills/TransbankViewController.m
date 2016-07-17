//
//  TransbankViewController.m
//  bills
//
//  Created by Rodrigo Esquivel on 16-07-16.
//  Copyright © 2016 Rodrigo Esquivel. All rights reserved.
//
#import "ExportViewController.h"
#import "BillTableViewCell.h"
#import "TransbankViewController.h"

@interface TransbankViewController ()
@property (nonatomic) NSMutableArray *bill;
@property (nonatomic) int row;
@property (nonatomic) NSDictionary *wsResponse;
@end

@implementation TransbankViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"TransbankView" bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    self.initial_bill = 0;
    
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.translucent = NO;
    [self.billTableView registerNib:[UINib nibWithNibName:@"BillTableViewCell" bundle:nil] forCellReuseIdentifier:@"CellID"];
    
    self.billNumber_txtField.text = [NSString stringWithFormat:@"%d",self.initial_bill];
    self.bill = [NSMutableArray new];
    self.billValue_txtField.delegate = self;
    
    NSMutableDictionary *detail = [NSMutableDictionary new];
    
    [detail setValue:@"firstItem" forKey:@"number"];
    [detail setValue:@"firstItem" forKey:@"value"];
    [self.bill addObject:detail];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"Eliminar" style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(delete)];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Añadir" style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(add)];
    deleteButton.tintColor = [UIColor blueColor];
    addButton.tintColor = [UIColor blueColor];
    
    
    [[self navigationItem] setRightBarButtonItems:[NSArray arrayWithObjects:                                              addButton, deleteButton, nil]];
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.billValue_txtField) {
        [theTextField resignFirstResponder];
    }
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //hides keyboard when another part of layout was touched
    [[self navigationItem] setRightBarButtonItems:[NSArray new]];
    if([self.bill count]-1 != 0){
            UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Terminar" style:UIBarButtonItemStylePlain
                                                                             target:self action:@selector(finish:)];
            self.navigationItem.rightBarButtonItem = anotherButton;
    }
   
    
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


- (void)add{
        
    self.billNumber_txtField.text = [NSString stringWithFormat:@"%d",self.initial_bill];
    NSMutableDictionary *detail = [NSMutableDictionary new];
    
    [detail setValue:self.billNumber_txtField.text forKey:@"number"];
    [detail setValue:self.billValue_txtField.text forKey:@"value"];
    [self.bill addObject:detail];
    self.initial_bill ++;
    self.billNumber_txtField.text = [NSString stringWithFormat:@"%d",self.initial_bill];
    self.row++;
    self.billValue_txtField.text = @"";
    self.billValue_txtField.placeholder = @"Ingrese Valor Boleta. Ej: 200";
    [self.billTableView reloadData];
    [self performSelector:@selector(goToBottom) withObject:nil afterDelay:0.2];

    [[self navigationItem] setRightBarButtonItems:[NSArray                                          new]];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Terminar" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(finish:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    [self.view endEditing:YES];
}

- (void)delete{
    if(self.row < 0){
        [self showMessage:@"Please, check bill number because is over the initial bill range"
                withTitle:@"Error"];
    }else{
        NSMutableDictionary *detail = [NSMutableDictionary new];
        
        [detail setValue:self.billNumber_txtField.text forKey:@"number"];
        [detail setValue:self.billValue_txtField.text forKey:@"value"];
        [self.bill removeObjectAtIndex:self.row];
        self.initial_bill --;
        self.row--;
        self.billNumber_txtField.text = [NSString stringWithFormat:@"%d",self.initial_bill];
        [self.billTableView reloadData];
    }
    [[self navigationItem] setRightBarButtonItems:[NSArray new]];
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Terminar" style:UIBarButtonItemStylePlain
                                                                     target:self action:@selector(finish:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    [self.view endEditing:YES];
}

- (IBAction)finish:(UIButton *)sender {
    
    if([self.bill count] == 0){
        [self showMessage:@"No existen boletas ingresadas"
                withTitle:@"Error"];
        
    }else{
        // replace right bar button 'refresh' with spinner
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        spinner.center = self.view.center;
        spinner.hidesWhenStopped = YES;
        [self.view addSubview:spinner];
        [spinner startAnimating];
        
        // how we stop refresh from freezing the main UI thread
        dispatch_queue_t downloadQueue = dispatch_queue_create("downloader", NULL);
        dispatch_async(downloadQueue, ^{
            NSLog(@"%@",[self.bill description]);
            int total = 0;
            for(int i = 1 ; i < [self.bill count] ; i++){
                NSDictionary *item = [self.bill objectAtIndex:i];
                total += [item[@"value"] intValue];
            }
            NSString *var0 = @"day=";
            NSString *var1 = [var0 stringByAppendingString:self.day];
            NSString *var2 = [var1 stringByAppendingString:@"&month="];
            NSString *var3 = [var2 stringByAppendingString:self.month];
            NSString *var4 = [var3 stringByAppendingString:@"&year="];
            NSString *var5 = [var4 stringByAppendingString:self.year];
            NSString *var6 = [var5 stringByAppendingString:@"&bill_value="];
            NSString *post = [var6 stringByAppendingString:[NSString stringWithFormat:@"%d",total]];
            
            NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:[NSURL URLWithString:@"http://always420.cl/wsAddBillTransbank.php"]];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            NSData *response = [NSURLConnection sendSynchronousRequest:request
                                                     returningResponse:nil error:nil];
            
            self.wsResponse = [NSJSONSerialization JSONObjectWithData:response options:0 error:nil];
            // do our long running process here
            [NSThread sleepForTimeInterval:0.5];
            
            // do any UI stuff on the main UI thread
            dispatch_async(dispatch_get_main_queue(), ^{
                [spinner stopAnimating];
                [self didFinish];
            });
            
        });
    }
    
    
    
}

-(void)didFinish{
    
    ExportViewController *rangeView = [ExportViewController new];
    rangeView.type = @"Transbank";
    [[self navigationController] pushViewController:rangeView animated:YES];
    
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

-(void)goToBottom
{
    NSIndexPath *lastIndexPath = [self lastIndexPath];
    [self.billTableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

-(NSIndexPath *)lastIndexPath
{
    
    NSInteger lastSectionIndex = MAX(0, [self.billTableView numberOfSections] - 1);
    NSInteger lastRowIndex = MAX(0, [self.billTableView numberOfRowsInSection:lastSectionIndex] - 1);
    return [NSIndexPath indexPathForRow:lastRowIndex inSection:lastSectionIndex];
    
}

#pragma mark tableview delegate

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.row;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BillTableViewCell *cell = [self.billTableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    if(!cell){
        cell = [self.billTableView dequeueReusableCellWithIdentifier:@"CellID"];
    }
    
    NSDictionary *item = [self.bill objectAtIndex:indexPath.row+1];
    cell.dayLbl.text = self.day;
    cell.billNumberLbl.text = item[@"number"]?:@"-";
    cell.billValueLbl.text = item[@"value"]?:@"-";
    
    return cell;
}
@end
