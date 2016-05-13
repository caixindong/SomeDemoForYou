//
//  People.m
//  runtime 之 消息动态解析(三)
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "People.h"

@implementation People

//不动态添加方法
+(BOOL)resolveInstanceMethod:(SEL)sel{
    return NO;
}

//不指定备选响应对象
-(id)forwardingTargetForSelector:(SEL)aSelector{
    return nil;
}

//返回方法签名
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"sing"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

//修改调用方法
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    [anInvocation setSelector:@selector(dance)];
    [anInvocation invokeWithTarget:self];
}

//若不实现forwardInvocation，则会调用此方法(可以注释掉forwardInvocation方法来做实验)
-(void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"消息无法处理:%@",NSStringFromSelector(aSelector));
}

-(void)dance{
    NSLog(@"跳舞中");
}

@end
