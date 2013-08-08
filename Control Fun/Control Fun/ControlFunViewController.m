//
//  ControlFunViewController.m
//  Control Fun
//
//  Created by pan dabo on 13-8-6.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "ControlFunViewController.h"

@interface ControlFunViewController ()

@end

@implementation ControlFunViewController

@synthesize nameField;
@synthesize numberField;
@synthesize sliderLable;
@synthesize leftSwitch;
@synthesize rightSwitch;
@synthesize doSomeThingButton;

-(IBAction)textFieldDoneEditDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}
-(IBAction)backgroundTap:(id)sender
{
    [numberField resignFirstResponder];
    [nameField resignFirstResponder];
}

-(IBAction)sliderChanged:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    int progressAsInt = (int)(slider.value + 0.5f);
    NSString *newText = [[NSString alloc] initWithFormat:@"%d", progressAsInt];
    sliderLable.text = newText;
    [newText release];
}

-(IBAction)toggleControls:(id)sender
{
    if ([sender selectedSegmentIndex] == kSwitchesSegmentIndex) {
        leftSwitch.hidden = NO;
        rightSwitch.hidden = NO;
        doSomeThingButton.hidden = YES;
    }else
    {
        leftSwitch.hidden = YES;
        rightSwitch.hidden = YES;
        doSomeThingButton.hidden = NO;
    }
}

-(IBAction)switchChanged:(id)sender
{
    UISwitch *whitchSWitch = (UISwitch *)sender;
    BOOL setting = whitchSWitch.isOn;
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];
}

-(IBAction)buttonPressed
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure?" delegate:self cancelButtonTitle:@"No Way!" destructiveButtonTitle:@"Yes, I'm Sure!" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
    [actionSheet release];
    
  
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex !=[actionSheet cancelButtonIndex]) {
        NSString *msg = nil;
        if (nameField.text.length > 0) {
            msg = [[NSString alloc] initWithFormat:@"You can breathe easy, %@, everything went OK.",nameField.text];
        }else
        {
            msg = @"You can breath easy, everything went Ok.";
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Something was done" message:msg delegate:self cancelButtonTitle:@"Phew" otherButtonTitles: nil];
        [alert show];
        [alert release];
        [msg release];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [nameField release];
    [numberField release];
    [sliderLable release];
    [leftSwitch release];
    [rightSwitch release];
    [doSomeThingButton release];
    [super dealloc];
}

@end
