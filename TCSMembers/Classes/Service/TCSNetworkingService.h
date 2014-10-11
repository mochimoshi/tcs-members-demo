//
//  TCSNetworkingService.h
//  TCSMembers
//
//  Created by Alex Yuh-Rern Wang on 10/9/14.
//  Copyright (c) 2014 Chromatiqa. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TCSSuccessBlock)(id responseObject);
typedef void (^TCSFailureBlock)(NSError *error);

@interface TCSNetworkingService : NSObject

+ (instancetype)sharedNetworkingService;

- (void)getMembersWithSuccess:(TCSSuccessBlock)success failure:(TCSFailureBlock)failure;


@end
