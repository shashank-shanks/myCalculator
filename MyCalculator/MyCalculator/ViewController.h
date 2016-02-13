//
//  ViewController.h
//  MyCalculator
//
//  Created by Shashank on 2/12/16.
//  Copyright © 2016 Zappos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *resultView;
@property (weak, nonatomic) IBOutlet UITextField *inputView;

- (IBAction)numberTapped:(id)sender;

- (IBAction)backSpaceTapped:(id)sender;

- (IBAction)backTapped:(id)sender;

- (IBAction)forwardTapped:(id)sender;

- (IBAction)resetTapped:(id)sender;


- (IBAction)solveTapped:(id)sender;

@end

