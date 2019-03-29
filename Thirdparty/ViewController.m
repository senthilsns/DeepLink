//
//  ViewController.m
//  Thirdparty
//
//  Created by appledeveloper on 28/03/19.
//  Copyright © 2019 Senthilkumar K. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
}

#pragma mark - Netflix
- (IBAction)netflixAction:(id)sender {
    
    NSURL *url = [[NSURL alloc] initWithString:@"nflx://www.netflix.com/title/70291117"];

    [self openURL:url ServiceName:@"Netflix"];
    
}

#pragma mark - hulu
- (IBAction)huluAction:(id)sender {
   
    NSURL *url = [[NSURL alloc] initWithString:@"hulu://www.netflix.com/title/70291117"];

    [self openURL:url ServiceName:@"hulu"];

    
}

#pragma mark - prime video
- (IBAction)primevideoAction:(id)sender {
    
    //Ref: https://www.appsight.io/app/amazon-prime-video
    NSURL *url = [[NSURL alloc] initWithString:@"aiv://www.netflix.com/title/70291117"];
    
    [self openURL:url ServiceName:@"Prime Video"];

    
}


#pragma mark - URL Scheme

- (void) openURL:(NSURL*)URL ServiceName:(NSString*)Str {
    [[UIApplication sharedApplication] openURL:URL options:@{} completionHandler:^ (BOOL success) {
        if (success) return;
        
        NSString * tempStr = [NSString stringWithFormat:@"Please Install %@ Application In your TV",Str];
        UIAlertController* alert =
        [UIAlertController alertControllerWithTitle:@"Open Failed"
                                            message:tempStr
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction*defaultAction =
        [UIAlertAction actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                               handler:nil];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

@end
