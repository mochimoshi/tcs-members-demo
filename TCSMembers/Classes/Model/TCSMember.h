//
//  TCSMember.h
//  TCSMembers
//
//  Created by Alex Yuh-Rern Wang on 10/9/14.
//  Copyright (c) 2014 Chromatiqa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCSMember : NSObject

@property (strong, nonatomic) NSString *memberName;
@property (strong, nonatomic) NSString *memberRole;
@property (strong, nonatomic) NSString *memberEmail;
@property (assign, nonatomic) NSInteger memberYear;
@property (strong, nonatomic) NSURL *memberImage;
@property (assign, nonatomic) BOOL isUndergrad;

- (instancetype)initWithName:(NSString *)name role:(NSString *)role email:(NSString *)email year:(NSInteger)year image:(NSURL *)image isUndergrad:(BOOL)isUndergrad;

@end
