//
//  TCSNetworkingService.m
//  TCSMembers
//
//  Created by Alex Yuh-Rern Wang on 10/9/14.
//  Copyright (c) 2014 Chromatiqa. All rights reserved.
//

#import "TCSNetworkingService.h"

#import <AFNetworking/AFNetworking.h>

@implementation TCSNetworkingService

static NSString *kMembersURL = @"http://tsukihi.org/temporary/tcs_members.json";

+ (instancetype)sharedNetworkingService {
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void)getMembersWithSuccess:(TCSSuccessBlock)success failure:(TCSFailureBlock)failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:kMembersURL
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             if([responseObject isKindOfClass:[NSDictionary class]]) {
                success(responseObject);
             }
             else {
                 NSLog(@"Unexpected type reached");
             }
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             failure(error);
         }];
}



@end
