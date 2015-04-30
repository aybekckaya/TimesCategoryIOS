//
//  NSDate+helpers.h
//  TimesIOS
//
//  Created by aybek can kaya on 4/30/15.
//  Copyright (c) 2015 aybek can kaya. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
    - toInteger
    + toInteger : currTime to integer 

 +/- add,substract year/month/day/hour/minute/second
 
   -/+ dayIndex
 
  -/+ isBetweenDatesBeginDate:(NSDate )beginDate EndDate:(NSDate )endDate
 
   -/+ year/month/day/hour range
 
 */


#define DAY_KEY @"day"
#define HOUR_KEY @"hour"
#define MINUTE_KEY @"minute"
#define SECOND_KEY @"second"


@interface NSDate (helpers)


/**
    @return : number of seconds passed after 01/01/1970 00:00:00
 */
-(int)toInteger;

/**
 works without instance. Current date is taken as an instance
 @return : number of seconds passed after 01/01/1970 00:00:00
 */
+(int)toInteger;


#pragma mark Time Operations

/**
 @return : new date after adding components in given dictionary.
 */
-(NSDate *)dateByAddingTimeDictionary:(NSDictionary *)dctTime;


/**
  works without instance. Current date is taken as an instance
 @return : new date after adding components in given dictionary.
 */
+(NSDate *)dateByAddingTimeDictionary:(NSDictionary *)dctTime;

/**
 @return : new date after substracting components in given dictionary.
 */
-(NSDate *)dateBySubstractingTimeDictionary:(NSDictionary *)dctTime;

/**
 works without instance. Current date is taken as an instance
 @return : new date after substracting components in given dictionary.
 */
+(NSDate *)dateBySubstractingTimeDictionary:(NSDictionary *)dctTime;


#pragma mark Date Index


/**
    @return: day index in a week. Sunday is the 0th day in the week
 */
-(int)dayIndexInWeek;

/**
 works without instance. Current date is taken as an instance
 @return: day index in a week. Sunday is the 0th day in the week
 */
+(int)dayIndexInWeek;


#pragma mark Create Date From Components


/**
 works without instance. 
 @return : NSDate object from given date components
 */
+(NSDate *)dateFromYear:(int)yearINT Month:(int)monthINT Day:(int)dayINT Hour:(int)hourINT Minute:(int)minuteINT Second:(int)secondINT;


#pragma mark Compare Dates 

/**
   @return : YES if the date instance is between begin and end dates
 */
-(BOOL)isBetweenDatesBeginDate:(NSDate *)dateBegin endDate:(NSDate *)dateEnd;

/**
  works without instance. Current date is taken as an instance
 @return : YES if the date instance is between begin and end dates
 */
+(BOOL)isBetweenDatesBeginDate:(NSDate *)dateBegin endDate:(NSDate *)dateEnd;

#pragma mark Date Components

@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger year;

@end
