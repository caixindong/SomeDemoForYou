//
//  main.m
//  runtime 之 消息动态解析(一)
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        People* p = [[People alloc]init];
        p.name = @"张全蛋";
        [p sing];
    }
    return 0;
}
