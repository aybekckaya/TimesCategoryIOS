//
//  NSDate+helpers.m
//  TimesIOS
//
//  Created by aybek can kaya on 4/30/15.
//  Copyright (c) 2015 aybek can kaya. All rights reserved.
//

#import "NSDate+helpers.h"

#define SECOND 1
#define MINUTE	60
#define HOUR		3600
#define DAY		86400

#define DATE_COMPONENTS (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]

@implementation NSDate (helpers)

-(int)toInteger
{
    int intVal = [self timeIntervalSince1970];
    return intVal;
}

+(int)toInteger
{
    NSDate *currDate = [NSDate date];
    return [currDate toInteger];
}

-(NSDate *)dateByAddingTimeDictionary:(NSDictionary *)dctTime
{
    int baseInteger = [self toInteger];
    
    int numSeconds = [NSDate timeDictionaryToSeconds:dctTime];
    baseInteger += numSeconds;
    NSDate *finalDate = [NSDate dateWithTimeIntervalSince1970:baseInteger];
    
    return finalDate;
}

+(NSDate *)dateByAddingTimeDictionary:(NSDictionary *)dctTime
{
    NSDate *currDate = [NSDate date];
    return [currDate dateByAddingTimeDictionary:dctTime];
}


-(NSDate *)dateBySubstractingTimeDictionary:(NSDictionary *)dctTime
{
    int baseInteger = [self toInteger];
    
    int numSeconds = [NSDate timeDictionaryToSeconds:dctTime];
    baseInteger -= numSeconds;
    NSDate *finalDate = [NSDate dateWithTimeIntervalSince1970:baseInteger];
    return finalDate;
}

+(NSDate *)dateBySubstractingTimeDictionary:(NSDictionary *)dctTime
{
    NSDate *currDate = [NSDate date];
    return [currDate dateBySubstractingTimeDictionary:dctTime];
}


+(int)timeDictionaryToSeconds:(NSDictionary *)timeDct
{
    int numSecondsFinal = 0;
    NSDictionary *rangeDct = @{SECOND_KEY : [NSNumber numberWithInt:SECOND] , MINUTE_KEY : [NSNumber numberWithInt:MINUTE] , HOUR_KEY:[NSNumber numberWithInt:HOUR] , DAY_KEY : [NSNumber numberWithInt:DAY]};
    
    NSArray *allKeys = [timeDct allKeys];
    
    for(NSString *key in allKeys)
    {
        int numSeconds = [rangeDct[key] intValue];
        int givenVal = [timeDct[key] intValue];
        
        int adding = numSeconds * givenVal;
        numSecondsFinal+= adding;
    }

    return numSecondsFinal;
}


#pragma mark Date Components

-(NSDateComponents *)dateComps
{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:self];
    return components;
}

- (NSInteger) hour
{
    NSDateComponents *components = [self dateComps];
  
    return components.hour;
}

- (NSInteger) minute
{
    NSDateComponents *components = [self dateComps];
    
    return components.minute;
}



- (NSInteger) seconds
{
    NSDateComponents *components = [self dateComps];
    
    return components.second;
}


- (NSInteger) day
{
    NSDateComponents *components = [self dateComps];
    
    return components.day;
}


- (NSInteger) month
{
    NSDateComponents *components = [self dateComps];
    
    return components.month;
}



- (NSInteger) year
{
    NSDateComponents *components = [self dateComps];
    
    return components.year;
}



#pragma mark Date Index

-(int)dayIndexInWeek
{
    NSDateComponents *components  = [self dateComps];
    int theIndex = [components weekday];
    return theIndex;
}

+(int)dayIndexInWeek
{
    NSDate *currDate = [NSDate date];
    return [currDate dayIndexInWeek];
}




#pragma mark Create Date From Components


+(NSDate *)dateFromStringWithFormat:(NSString *)dateFormat DateString:(NSString *)dateStr
{
    NSDateFormatter *dateFormatter =[[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = dateFormat;
    return [dateFormatter dateFromString:dateStr];
}


+(NSDate *)dateFromYear:(int)yearINT Month:(int)monthINT Day:(int)dayINT Hour:(int)hourINT Minute:(int)minuteINT Second:(int)secondINT
{
    NSString *monthStr = [NSString stringWithFormat:@"%d", monthINT];
    
    if(monthINT < 10)
    {
        monthStr = [NSString stringWithFormat:@"0%d", monthINT];
    }
    
    NSString *dayStr = [NSString stringWithFormat:@"%d", dayINT];
    
    if(dayINT < 10)
    {
        dayStr = [NSString stringWithFormat:@"0%d", dayINT];
    }
    
    NSString *hourStr = [NSString stringWithFormat:@"%d", hourINT];
    
    if(hourINT < 10)
    {
        hourStr = [NSString stringWithFormat:@"0%d", hourINT];
    }
    
    
    NSString *minuteStr = [NSString stringWithFormat:@"%d", minuteINT];
    
    if(minuteINT < 10)
    {
        minuteStr = [NSString stringWithFormat:@"0%d", minuteINT];
    }
    
    
    NSString *secondStr = [NSString stringWithFormat:@"%d", secondINT];
    
    if(secondINT < 10)
    {
        secondStr = [NSString stringWithFormat:@"0%d", secondINT];
    }
    
    NSString *fullDate = [NSString  stringWithFormat:@"%d/%@/%@ %@:%@:%@", yearINT, monthStr, dayStr , hourStr,minuteStr,secondStr];
    
    NSDate *dateFinal = [NSDate dateFromStringWithFormat:@"yyyy/MM/dd HH:mm:ss" DateString:fullDate];
    
    
    return dateFinal;
    
}


#pragma mark Compare Dates 

-(BOOL)isBetweenDatesBeginDate:(NSDate *)dateBegin endDate:(NSDate *)dateEnd
{
    int currDateInteger = [self toInteger];
    
    if(dateBegin != nil && dateEnd != nil)
    {
        int dateBeginInteger = [dateBegin toInteger];
        int dateEndInteger = [dateEnd toInteger];
        
        if(currDateInteger > dateBeginInteger && currDateInteger < dateEndInteger)
        {
            return YES;
        }
        return NO;
        
    }
    else if(dateBegin == nil && dateEnd != nil)
    {
        
        int dateEndInteger = [dateEnd toInteger];
        
        if( currDateInteger < dateEndInteger)
        {
            return YES;
        }
        return NO;
    }
    else if(dateBegin != nil && dateEnd == nil)
    {
        int dateBeginInteger = [dateBegin toInteger];
        
        if( currDateInteger > dateBeginInteger)
        {
            return YES;
        }
        return NO;
    }
    else if(dateEnd == nil && dateBegin == nil)
    {
       // assert
        NSAssert(NO, @"Both EndDate and BeginDate should not be nil . ");
        return NO;
    }
    else
    {
        return NO;
    }
    
    return NO;
}

+(BOOL)isBetweenDatesBeginDate:(NSDate *)dateBegin endDate:(NSDate *)dateEnd
{
    NSDate *dateCurr = [NSDate date];
    return [dateCurr isBetweenDatesBeginDate:dateBegin endDate:dateEnd];
}


@end
