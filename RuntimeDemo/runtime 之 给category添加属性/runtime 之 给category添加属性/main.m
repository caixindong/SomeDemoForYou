//
//  main.m
//  runtime 之 给category添加属性
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People+testCategory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        People* p = [[People alloc]init];
        p.name = @"罗大锤";
        p.age = @(30);
        [p setValue:@"中国" forKey:@"nationality"];
        p.address = @"北京";
        p.block = ^(){
            NSLog(@"我最屌");
        };
        NSLog(@"来自%@%@的%@说:",[p valueForKey:@"nationality"],p.address,p.name);
        p.block();
    }
    return 0;
}
