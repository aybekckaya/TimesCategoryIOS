//
//  ViewController.m
//  TimesIOS
//
//  Created by aybek can kaya on 4/30/15.
//  Copyright (c) 2015 aybek can kaya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testDate];
}


-(void)testDate
{
    // to integer
    NSDate *date = [NSDate date];
    int integer = [date toInteger];
    
    // additions
    
    NSDictionary *dctAdder = @{DAY_KEY : [NSNumber numberWithInt:4] };
    NSDate *newDate = [date dateByAddingTimeDictionary:dctAdder];
    
    dctAdder = @{DAY_KEY : [NSNumber numberWithInt:4] , MINUTE_KEY:[NSNumber numberWithInt:35]};
    newDate = [date dateByAddingTimeDictionary:dctAdder];
    
    // substract
    
    dctAdder = @{DAY_KEY : [NSNumber numberWithInt:7] , MINUTE_KEY:[NSNumber numberWithInt:35] , HOUR_KEY:[NSNumber numberWithInt:6]};
    newDate = [date dateBySubstractingTimeDictionary:dctAdder];
    
    // get date Components
    NSInteger day = date.day;
    NSInteger month = date.month;
    
    
    // day index
    int dayIndex = [date dayIndexInWeek];
    
    // create date by components
    NSDate *dateFromComponents = [NSDate dateFromYear:2015 Month:4 Day:30 Hour:16 Minute:30 Second:55];
    NSLog(@"date From Components : %@" , dateFromComponents);
    
    // date compare
    
    NSDictionary *dctTime = @{DAY_KEY : [NSNumber numberWithInt:3]};
    
    NSDate *currDate = [NSDate date];
    NSDate *beginDate = [currDate dateBySubstractingTimeDictionary:dctTime];
    NSDate *endDate = [currDate dateByAddingTimeDictionary:dctTime];
    
    
    BOOL isBetween =[currDate isBetweenDatesBeginDate:beginDate endDate:endDate];
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
