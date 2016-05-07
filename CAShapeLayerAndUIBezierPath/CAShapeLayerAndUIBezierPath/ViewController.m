//
//  ViewController.m
//  CAShapeLayerAndUIBezierPath
//
//  Created by 蔡欣东 on 16/4/21.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
@interface ViewController (){
    CAShapeLayer *layer;
}

@end


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //仅仅使用UIBezierPath的话，需要在view的drawRect方法里实现,详细可以看MyView的drawRect方法
//    CGFloat W = [UIScreen mainScreen].bounds.size.width;
//    CGFloat H = [UIScreen mainScreen].bounds.size.height;
//    MyView* myView = [[MyView alloc]initWithFrame:CGRectMake(0, 0, W, H)];
//    myView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:myView];
    
    
    
    
    //CAShapeLayer和UIBezierPath画图
    
    layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth =  20.0f;
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    layer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    // 创建贝塞尔路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:80 startAngle:0 endAngle:M_PI*2 clockwise:NO];
    
    
    // 关联layer和贝塞尔路径
    layer.path = path.CGPath;
    
    // 创建Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    layer.autoreverses = NO;
    animation.duration = 3.0;
    
    // 设置layer的animation
    [layer addAnimation:animation forKey:nil];
    animation.delegate = self;
    
    
    int count = 16;
    for (int i = 0; i<count; i++) {
        CAShapeLayer* lineLayer = [CAShapeLayer layer];
        lineLayer.fillColor = [UIColor clearColor].CGColor;
        lineLayer.strokeColor = [UIColor yellowColor].CGColor;
        lineLayer.lineWidth = 15.0f;
        lineLayer.lineCap = kCALineCapRound;
        lineLayer.lineJoin = kCALineCapRound;
        [self.view.layer addSublayer:lineLayer];
        
        UIBezierPath* path2 = [UIBezierPath bezierPath];
        int x = 200+100*cos(2*M_PI/count*i);
        int y = 200-100*sin(2*M_PI/count*i);
        int len = 50;
        [path2 moveToPoint:CGPointMake(x, y)];
        [path2 addLineToPoint:CGPointMake(x+len*cos(2*M_PI/count*i), y-len*sin(2*M_PI/count*i))];
        lineLayer.path = path2.CGPath;
        [lineLayer addAnimation:animation forKey:nil];
    }

}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"yes");
    layer.fillColor = [UIColor redColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end