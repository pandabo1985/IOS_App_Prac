//
//  ControlFunViewController.h
//  Control Fun
//
//  Created by pan dabo on 13-8-6.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSwitchesSegmentIndex 0

@interface ControlFunViewController : UIViewController <UIAccelerometerDelegate>
{
    UITextField *nameField;
    UITextField *numberField;
    UILabel *sliderLable;
    
    UISwitch *leftSwitch;
    UISwitch *rightSwitch;
    UIButton *doSomeThingButton;
    
}

@property(nonatomic, retain) IBOutlet UITextField *nameField;
@property(nonatomic, retain) IBOutlet UITextField *numberField;
@property(nonatomic, retain) IBOutlet UILabel *sliderLable;
@property(nonatomic, retain) IBOutlet UISwitch *leftSwitch;
@property(nonatomic, retain) IBOutlet UISwitch *rightSwitch;
@property(nonatomic, retain) IBOutlet UIButton *doSomeThingButton;
 
-(IBAction)textFieldDoneEditDoneEditing:(id)sender;
-(IBAction)backgroundTap:(id)sender;
-(IBAction)sliderChanged:(id)sender;
-(IBAction)toggleControls:(id)sender;
-(IBAction)switchChanged:(id)sender;
-(IBAction)buttonPressed;

@end
