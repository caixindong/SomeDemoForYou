//
//  main.m
//  runtime 之 Model 与 JSON 转换
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary* dict = @{@"name":@"张铁柱",
                               @"age":@39,
                               };
        People* p2 = [[People alloc]initWithDictionary:dict];
        NSLog(@"我叫%@，今年%@岁",p2.name,p2.age);
        NSLog(@"%@",[p2 covertToDictionary]);
    }
    return 0;
}
