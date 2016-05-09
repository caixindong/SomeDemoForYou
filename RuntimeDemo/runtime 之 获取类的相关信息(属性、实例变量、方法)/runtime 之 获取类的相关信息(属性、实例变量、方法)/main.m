//
//  main.m
//  runtime 之 获取类的相关信息(属性、实例变量、方法)
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
#pragma mark - runtime 之 获取类的相关信息(属性、实例变量、方法)
        People* p = [[People alloc]init];
        p.name = @"罗大锤";
        p.age = @(30);
        [p setValue:@"中国" forKey:@"nationality"];
        NSDictionary* properties = [p getAllProperties];
        NSDictionary* ivars = [p getAllIvars];
        NSDictionary* methods = [p getAllMethods];
        NSLog(@"属性为：%@",properties);
        NSLog(@"实例变量：%@",ivars);
        NSLog(@"方法：%@",methods);
    }
    return 0;
}
