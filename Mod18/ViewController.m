//
//  ViewController.m
//  Mod18
//
//  Created by Krunal on 3/11/15.
//  Copyright (c) 2015 KM. All rights reserved.
//

#import "ViewController.h"

@import MessageUI;

@interface ViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation ViewController

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Failed");
        case MFMailComposeResultSaved:
            NSLog(@"Saved");
        case MFMailComposeResultSent:
            NSLog(@"Sent");
        default:
            NSLog(@"Default");
            break;
    }
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(NO == [MFMailComposeViewController canSendMail])
    {
        NSLog(@"Cannot send mail");
        return;
    }
    
    MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
    vc.mailComposeDelegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
