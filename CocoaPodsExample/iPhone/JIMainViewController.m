//
//  JIMainViewController.m
//  CocoaPodsExample
//
//  Created by Jose Ibanez on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JIMainViewController.h"
#import "SHK.h"

@interface JIMainViewController ()

@end

@implementation JIMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    [super loadView];
	// Do any additional setup after loading the view.
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    NSLog(@"%@ = %@", kJIJoeGorillaImageName, [UIImage imageNamed:kJIJoeGorillaImageName]);
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:kJIJoeGorillaImageName]];
    image.frame = self.view.bounds;
    image.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    image.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:image];
    
    UIToolbar *tool = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, self.view.bounds.size.height - 44.0, self.view.bounds.size.width, 44.0)];
    tool.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    NSArray *tools = [NSArray arrayWithObjects:
                      [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], 
                      [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share:)], 
                      [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil], 
                      nil];
    tool.items = tools;
    [self.view addSubview:tool];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Received Actions

- (void)share:(id)sender {
    NSLog(@"share pressed!");
    
//    SHKItem *item = [SHKItem URL:[NSURL URLWithString:@"http://github.com/jose-ibanez"] title:@"Check out my awesome github page!"];
//    [SHK setRootViewController:self];
//    SHKActionSheet *shareSheet = [SHKActionSheet actionSheetForItem:item];
//    [shareSheet showInView:self.view];
}


@end
