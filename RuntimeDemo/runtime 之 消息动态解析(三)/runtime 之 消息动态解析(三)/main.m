//
//  main.m
//  runtime 之 消息动态解析(三)
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "People.h"
#import <objc/runtime.h>
#import <objc/message.h>

/**
 * 修改调用方法
 **/
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        People* p = [[People alloc]init];
        [p sing];
    }
    return 0;
}
