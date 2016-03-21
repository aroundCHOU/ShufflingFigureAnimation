//
//  ViewController.m
//  ShufflingFigureAnimation
//
//  Created by 周围 on 16/3/19.
//  Copyright © 2016年 ZhouWei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIView *myView;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,assign) BOOL imageViewBool;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageViewBool = YES;
    self.myView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 150)];
    self.myView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.myView];
    
    self.imageView = [[UIImageView alloc] initWithFrame:self.myView.bounds];
    self.imageView.image = [UIImage imageNamed:@"hah.jpg"];
    [self.myView addSubview:self.imageView];
    
    //********CABasicAnimation********
    //旋转
    //    //1.创建CABasicAnimation对象(注意：keyPath 是可以设置动画的属性)
    //    CABasicAnimation *ba = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    //    //2.1 设置持续时间
    //    ba.duration = 3.0f;
    //    //2.2 设置开始值
    //    ba.fromValue = @(0);
    //    //2.3 设置结束值
    //    ba.toValue = @(M_PI);
    //    //3.添加动画到layer上
    //    [self.myView.layer addAnimation:ba forKey:@"myView"];
    //    //4.移除动画
    //    [self.myView.layer removeAnimationForKey:@"myView"];
    
    
    
    //********CAKeyFrameAnimation********
    //颜色
    //1.创建对象
    CAKeyframeAnimation *keyA1 = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    //2.配置属性
    //2.1 设置持续时间
    keyA1.duration = 3;
    //2.2设置变化数组
    id obj1 = (id)[UIColor orangeColor].CGColor;
    id obj2 = (id)[UIColor yellowColor].CGColor;
    id obj3 = (id)[UIColor greenColor].CGColor;
    keyA1.values = @[obj1,obj2,obj3];
    //    //3.添加到layer上
    //    [self.myView.layer addAnimation:keyA1 forKey:@"keyA1"];
    //    //4.移除
    //    [self.view.layer removeAnimationForKey:@"keyA1"];
    
    
    //位置
    CAKeyframeAnimation *keyA2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyA2.duration = 3;
    NSValue *pos1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *pos2 = [NSValue valueWithCGPoint:CGPointMake(150, 150)];
    NSValue *pos3 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    keyA2.values = @[pos1,pos2,pos3];
    //    [self.myView.layer addAnimation:keyA2 forKey:@"keyA2"];
    //    [self.myView.layer removeAnimationForKey:@"keyA2"];
    
    //缩放
    //    CAKeyframeAnimation *keyA3 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    //    keyA3.duration = 3;
    //    NSValue *scl1 = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1)];
    //    NSValue *scl2 = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1)];
    //    NSValue *scl3 = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1)];
    //    id scl4 = @(0.5);      //比较简洁的写法
    //    keyA3.values = @[scl1,scl2,scl3,scl4];
    //    [self.myView.layer addAnimation:keyA3 forKey:@"keyA3"];
    //    [self.myView.layer removeAnimationForKey:@"keyA3"];
    
    
    //********CAAnimationGroup********
    //主要是：执行对个动画 CAAnimation 类的对象
    //1.创建CAAnimationGroup对象
    //    CAAnimationGroup *group = [CAAnimationGroup animation];
    //    //2.设置一个持续时间
    //    group.duration = 3;
    //    //3.将动画对象添加到数组中
    //    group.animations = @[keyA1,keyA2];
    //    //4.添加到layer上
    //    [self.myView.layer addAnimation:group forKey:@"group"];
    //    //5.移除
    //    [self.myView.layer removeAnimationForKey:@"group"];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeTransition) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:@"hahh"];
    [self.timer fire];
}

- (void)changeTransition{
    
    
    CATransition *trans = [CATransition animation];
    //2.设置属性
    //持续时间
    trans.duration = 1;
    //动画效果
    trans.type = @"cube";
    //    trans.type = @"cameraIrisHollowOpen";    //特殊效果
    //动画方向
    trans.subtype = @"fromLeft";
    //    trans.startProgress = 0.2;
    //    trans.endProgress = 0.9;
    //3.添加到layer
    [self.myView.layer addAnimation:trans forKey:@"trans"];
    //4.移除
    [self.myView.layer removeAnimationForKey:@"trans"];
    
    //
    //    unsigned int count = 0;
    //    Ivar *ivarArray = class_copyIvarList([UIImageView class], &count);
    //    for (int i = 0; i < count; i++) {
    //        const char *key = ivar_getName(ivarArray[i]);
    //        NSString *keys = [NSString stringWithUTF8String:key];
    //        NSLog(@"%@",keys);
    //    }
    
    if (self.imageViewBool) {
        self.imageViewBool = NO;
        self.imageView.image = [UIImage imageNamed:@"heh.jpg"];
    }else{
        self.imageViewBool = YES;
        self.imageView.image = [UIImage imageNamed:@"hah.jpg"];
        
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //********CATransition********
    //1.创建对象
    CATransition *trans = [CATransition animation];
    //2.设置属性
    //持续时间
    trans.duration = 1;
    //动画效果
    trans.type = @"cube";
    //    trans.type = @"cameraIrisHollowOpen";    //特殊效果
    //动画方向
    trans.subtype = @"fromLeft";
    //    trans.startProgress = 0.2;
    //    trans.endProgress = 0.9;
    //3.添加到layer
    [self.myView.layer addAnimation:trans forKey:@"trans"];
    //4.移除
    [self.myView.layer removeAnimationForKey:@"trans"];
    
    //
    //    unsigned int count = 0;
    //    Ivar *ivarArray = class_copyIvarList([UIImageView class], &count);
    //    for (int i = 0; i < count; i++) {
    //        const char *key = ivar_getName(ivarArray[i]);
    //        NSString *keys = [NSString stringWithUTF8String:key];
    //        NSLog(@"%@",keys);
    //    }
    
    if (self.imageViewBool) {
        self.imageViewBool = NO;
        self.imageView.image = [UIImage imageNamed:@"heh.jpg"];
    }else{
        self.imageViewBool = YES;
        self.imageView.image = [UIImage imageNamed:@"hah.jpg"];
        
    }
    //    self.imageViewBool != self.imageViewBool;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end