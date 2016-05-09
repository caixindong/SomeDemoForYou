//
//  main.m
//  runtime 之 消息动态解析(二)
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bird.h"
#import <objc/runtime.h>
#import <objc/message.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Bird* b = [[Bird alloc]init];
        b.name = @"小鸟";
        objc_msgSend(b, @selector(sing));
    }
    return 0;
}
