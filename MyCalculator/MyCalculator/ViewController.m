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

@property (nonatomic,readwrite) NSInteger cursorPosition; // unused. Useful for enhanced functionality in future

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 // setup relation Between The buttons and their respective functions
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
    [dict setObject:@"/" forKey:@"1010"];
    [dict setObject:@"*" forKey:@"1011"];
    [dict setObject:@"+" forKey:@"1012"];
    [dict setObject:@"-" forKey:@"1013"];
    
    
    self.buttonDictionary = dict;
    self.expressionString= @"";
    self.inputView.text =0;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)evaluateEnteredExpression:(NSString *) string
{
// Evaluates if the expression is valid. Else shows the error
    @try
    {
        
        NSExpression *expression = [NSExpression expressionWithFormat:string];
            NSPredicate * parsed = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"1.0 * %@ = 0", expression]];
            NSExpression * left = [(NSComparisonPredicate *)parsed leftExpression];
           id calculatedResult = [left expressionValueWithObject:nil context:nil];
        
        self.resultView.text = [NSString stringWithFormat:@"%@", calculatedResult];
        self.expressionString = @"";
        
    }
    @catch (NSException *exception)
    {
        NSLog(@"%@",exception);
        
        if (exception.name == NSInvalidArgumentException) {
            
            self.resultView.text = @"Invalid Entry. Please Check the Syntax";
            
        }
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Modifies
- (IBAction)numberTapped:(UIButton*)button
{
    self.inputView.text = [self.expressionString stringByAppendingString:[NSString stringWithFormat:@"%@",self.buttonDictionary[[NSString stringWithFormat:@"%@",@(button.tag
                                                                                                                                )]]]];
    
    self.expressionString= self.inputView.text;
    
    
}

- (IBAction)backSpaceTapped:(id)sender
{
    if (self.expressionString.length>1) {
        
    self.expressionString = [self.expressionString substringToIndex:self.expressionString.length-1];
        self.inputView.text = self.expressionString;
        
    }
    else
    {
        self.expressionString = @"";
        self.inputView.text = @"0";
    }
}

#pragma Future Methods

- (IBAction)backTapped:(id)sender {
}

- (IBAction)forwardTapped:(id)sender {
}


- (IBAction)solveTapped:(id)sender
{
    [self evaluateEnteredExpression:self.expressionString];
}
- (IBAction)resetTapped:(id)sender
{
    self.inputView.text = @"0";
    self.expressionString = @"";
    self.resultView.text= @"";
}
@end
