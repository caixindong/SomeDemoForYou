//
//  Bird.m
//  runtime 之 消息动态解析(二)
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "Bird.h"
#import "People.h"
@implementation Bird


//第一步，不动态添加方法
+(BOOL)resolveInstanceMethod:(SEL)sel{
    return NO;
}

//第二步，不指定备选对象响应sselector
-(id)forwardingTargetForSelector:(SEL)aSelector{
    return nil;
}

//第三步，返回方法签名
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"sing"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

//第四部，修改调用对象
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    People* p = [[People alloc]init];
    p.name = @"张铁柱";
    [anInvocation invokeWithTarget:p];
}

@end
