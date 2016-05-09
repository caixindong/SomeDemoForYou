//
//  People.m
//  runtime 之 消息动态解析(一)
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "People.h"
#import <objc/runtime.h>
#import <objc/message.h>


@implementation People

+(BOOL)resolveInstanceMethod:(SEL)sel{
    if ([NSStringFromSelector(sel) isEqualToString:@"sing"]) {
        class_addMethod([self class], sel, (IMP)otherIMP, "V@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void otherIMP(id self ,SEL cmd){
    NSLog(@"%@正在唱歌",((People*)self).name);
}

@end
