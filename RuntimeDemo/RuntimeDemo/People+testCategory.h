//
//  People+testCategory.h
//  RuntimeDemo
//
//  Created by 蔡欣东 on 16/5/8.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "People.h"


#pragma mark - 给category添加属性

typedef void(^CallBackSomething)();

@interface People (testCategory)

@property(nonatomic,copy)NSString* address;
@property(nonatomic,copy)CallBackSomething block;
@end
