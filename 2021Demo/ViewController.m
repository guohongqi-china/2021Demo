//
//  ViewController.m
//  2021Demo
//
//  Created by guohongqi on 2021/5/19.
//

#import "ViewController.h"
#import "SingletonPattern.h"
#import <objc/runtime.h>
#import "_021Demo-Swift.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLab;

@property (nonatomic, strong, nullable)  dispatch_group_t queue;

@property (nonatomic, strong)  ThreadRefreshUI           *uiView;
@property (nonatomic, strong)  NSTimer                           *timer;
@property (nonatomic, strong)  NSTimer                           *timer1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self singletonPattern];
    
//    _uiView = [ThreadRefreshUI loadNibView];
//    _uiView.frame = CGRectMake(50, 500, 200, 100);
//    [self.view addSubview:_uiView];
    
    



    
    
    

//    _queue = dispatch_queue_create("com.ZTO", DISPATCH_QUEUE_CONCURRENT);
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                         target:self
//                                       selector:@selector(handleTimer)
//                                       userInfo:nil
//                                        repeats:YES];
//    _timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0
//                                         target:self
//                                       selector:@selector(handleTimer1)
//                                       userInfo:nil
//                                        repeats:YES];
}

static int number = 0;

- (void)handleTimer{
    dispatch_async(self.queue, ^{
        NSLog(@"============%d",number);
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.uiView.timeLab.text = [NSString stringWithFormat:@"%d",number];
        });
    });
    number ++;
}

static int number1 = 0;

- (void)handleTimer1{
    dispatch_async(self.queue, ^{
        NSLog(@"============%d",number1);
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.textLab.text = [NSString stringWithFormat:@"%d",number1];
        });
    });
    number1 ++;
}

#pragma mark -  单例
- (void)singletonPattern{
    SingletonPattern *shareInstance = [SingletonPattern sharedInstance];
    NSLog(@"%@",shareInstance);
    
    SingletonPattern *shareInstance1 = [SingletonPattern sharedInstance];
    NSLog(@"%@",shareInstance1);

}


#pragma mark -  死锁
- (void)deadLock{
    // 非死锁
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"====");
    });
    // 死锁
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"====");
    });
}


@end
