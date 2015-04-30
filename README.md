
NSDate category for IOS and OSX written in Objective-C

<h2>Examples</h2>

Date To Integer : 
<pre> 
NSDate *date = [NSDate date];
int integer = [date toInteger];
</pre>

Adding date Components to NSDate :
<pre>
NSDate *date = [NSDate date];
 NSDictionary *dctAdder = @{DAY_KEY : [NSNumber numberWithInt:4] };
 NSDate *newDate = [date dateByAddingTimeDictionary:dctAdder];
</pre>

Substracting date Components from NSDate: 
<pre>
NSDate *date = [NSDate date];
    NSDictionary *dctAdder = @{DAY_KEY : [NSNumber numberWithInt:7] , MINUTE_KEY:[NSNumber numberWithInt:35] , HOUR_KEY:[NSNumber numberWithInt:6]};
     NSDate *newDate = [date dateBySubstractingTimeDictionary:dctAdder];
</pre>


<h2>All Methods</h2>
<pre> 

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


</pre>



