//
//  ViewController.m
//  MyCalculator
//
//  Created by Shashank on 2/12/16.
//  Copyright © 2016 Zappos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSDictionary* buttonDictionary;
@property (strong,nonatomic) NSString* expressionString;

@property (nonatomic,readwrite) NSInteger cursorPosition;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    
    [dict setObject:@"1" forKey:@"1001"];
    [dict setObject:@"2" forKey:@"1002"];
    [dict setObject:@"3" forKey:@"1003"];
    [dict setObject:@"4" forKey:@"1004"];
    [dict setObject:@"5" forKey:@"1005"];
    [dict setObject:@"6" forKey:@"1006"];
    [dict setObject:@"7" forKey:@"1007"];
    [dict setObject:@"8" forKey:@"1008"];
    [dict setObject:@"9" forKey:@"1009"];
    [dict setObject:@"0" forKey:@"1000"];
    [dict setObject:@"." forKey:@"999"];
    
    
    
    self.buttonDictionary = dict;
    self.expressionString= @"";
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)evaluateEnteredExpression:(NSString *) string
{
    @try
    {
        NSExpression *expression = [NSExpression expressionWithFormat:string];
        NSLog(@"%@",[expression expressionValueWithObject:nil context:nil]);
    }
    @catch (NSException *exception)
    {
        NSLog(@"%@",exception);
        
    }
    @finally {
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numberTapped:(UIButton*)button
{
    //self.expressionString = [self.expressionString stringByAppendingString:[dict[[NSString stringWithFormat:@"%ld",(long)button.tag]]]];
    
}

- (IBAction)backSpaceTapped:(id)sender {
}

- (IBAction)backTapped:(id)sender {
}

- (IBAction)forwardTapped:(id)sender {
}
- (IBAction)solveTapped:(id)sender
{
    [self evaluateEnteredExpression:self.expressionString];
}
- (IBAction)resetTapped:(id)sender {
}
@end
