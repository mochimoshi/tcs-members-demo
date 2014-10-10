//
//  TCSMemberDetailViewController.m
//  TCSMembers
//
//  Created by Alex Yuh-Rern Wang on 10/9/14.
//  Copyright (c) 2014 Chromatiqa. All rights reserved.
//

#import "TCSMemberDetailViewController.h"

@interface TCSMemberDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *memberNameLabel;

@end

@implementation TCSMemberDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.memberNameLabel setText:self.memberName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
