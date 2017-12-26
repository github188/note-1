# greenplum 

## functions

### 数字计算
- round( v numeric, s int ) 四舍五入
- trunc( v numeric, s int ) 截取掉小数位后多出的位数
- floor 小于的最大数  ceil 大于的最小数

### 字符串操作
- char_length( string ) 长度
- lower() upper() 大小写
- trim([leading | trailing | both] [characters] from string)  trim(both 'x' from 'xTomxx') ->	Tom

### date functions
-https://www.postgresql.org/docs/8.3/static/functions-datetime.html
- Operator	Example	Result
	+	date '2001-09-28' + integer '7'	date '2001-10-05'
	+	date '2001-09-28' + interval '1 hour'	timestamp '2001-09-28 01:00:00'
	+	date '2001-09-28' + time '03:00'	timestamp '2001-09-28 03:00:00'
	+	interval '1 day' + interval '1 hour'	interval '1 day 01:00:00'
	+	timestamp '2001-09-28 01:00' + interval '23 hours'	timestamp '2001-09-29 00:00:00'
	+	time '01:00' + interval '3 hours'	time '04:00:00'
	-	- interval '23 hours'	interval '-23:00:00'
	-	date '2001-10-01' - date '2001-09-28'	integer '3'
	-	date '2001-10-01' - integer '7'	date '2001-09-24'
	-	date '2001-09-28' - interval '1 hour'	timestamp '2001-09-27 23:00:00'
	-	time '05:00' - time '03:00'	interval '02:00:00'
	-	time '05:00' - interval '2 hours'	time '03:00:00'
	-	timestamp '2001-09-28 23:00' - interval '23 hours'	timestamp '2001-09-28 00:00:00'
	-	interval '1 day' - interval '1 hour'	interval '1 day -01:00:00'
	-	timestamp '2001-09-29 03:00' - timestamp '2001-09-27 12:00'	interval '1 day 15:00:00'
	*	900 * interval '1 second'	interval '00:15:00'
	*	21 * interval '1 day'	interval '21 days'
	*	double precision '3.5' * interval '1 hour'	interval '03:30:00'
	/	interval '1 hour' / double precision '1.5'	interval '00:40:00'

- Function	Return Type	Description	Example	Result
	age(timestamp, timestamp)	interval	Subtract arguments, producing a "symbolic" result that uses years and months	age(timestamp '2001-04-10', timestamp '1957-06-13')	43 years 9 mons 27 days
	age(timestamp)	interval	Subtract from current_date	age(timestamp '1957-06-13')	43 years 8 mons 3 days
	clock_timestamp()	timestamp with time zone	Current date and time (changes during statement execution); see Section 9.9.4	 	 
	current_date	date	Current date; see Section 9.9.4	 	 
	current_time	time with time zone	Current time of day; see Section 9.9.4	 	 
	current_timestamp	timestamp with time zone	Current date and time (start of current transaction); see Section 9.9.4	 	 
	date_part(text, timestamp)	double precision	Get subfield (equivalent to extract); see Section 9.9.1	date_part('hour', timestamp '2001-02-16 20:38:40')	20
	date_part(text, interval)	double precision	Get subfield (equivalent to extract); see Section 9.9.1	date_part('month', interval '2 years 3 months')	3
	date_trunc(text, timestamp)	timestamp	Truncate to specified precision; see also Section 9.9.2	date_trunc('hour', timestamp '2001-02-16 20:38:40')	2001-02-16 20:00:00
	extract(field from timestamp)	double precision	Get subfield; see Section 9.9.1	extract(hour from timestamp '2001-02-16 20:38:40')	20
	extract(field from interval)	double precision	Get subfield; see Section 9.9.1	extract(month from interval '2 years 3 months')	3
	isfinite(timestamp)	boolean	Test for finite time stamp (not equal to infinity)	isfinite(timestamp '2001-02-16 21:28:30')	true
	isfinite(interval)	boolean	Test for finite interval	isfinite(interval '4 hours')	true
	justify_days(interval)	interval	Adjust interval so 30-day time periods are represented as months	justify_days(interval '30 days')	1 month
	justify_hours(interval)	interval	Adjust interval so 24-hour time periods are represented as days	justify_hours(interval '24 hours')	1 day
	justify_interval(interval)	interval	Adjust interval using justify_days and justify_hours, with additional sign adjustments	justify_interval(interval '1 mon -1 hour')	29 days 23:00:00
	localtime	time	Current time of day; see Section 9.9.4	 	 
	localtimestamp	timestamp	Current date and time (start of current transaction); see Section 9.9.4	 	 
	now()	timestamp with time zone	Current date and time (start of current transaction); see Section 9.9.4	 	 
	statement_timestamp()	timestamp with time zone	Current date and time (start of current statement); see Section 9.9.4	 	 
	timeofday()	text	Current date and time (like clock_timestamp, but as a text string); see Section 9.9.4	 	 
	transaction_timestamp()	timestamp with time zone	Current date and time (start of current transaction); see Section 9.9.4	 	 

## Date Type Formatting Functions
- https://www.postgresql.org/docs/8.3/static/functions-formatting.html
- Formatting Functions
	Function	Return Type	Description	Example
	to_char(timestamp, text)	text	convert time stamp to string	to_char(current_timestamp, 'HH12:MI:SS')
	to_char(interval, text)	text	convert interval to string	to_char(interval '15h 2m 12s', 'HH24:MI:SS')
	to_char(int, text)	text	convert integer to string	to_char(125, '999')
	to_char(double precision, text)	text	convert real/double precision to string	to_char(125.8::real, '999D9')
	to_char(numeric, text)	text	convert numeric to string	to_char(-125.8, '999D99S')
	to_date(text, text)	date	convert string to date	to_date('05 Dec 2000', 'DD Mon YYYY')
	to_number(text, text)	numeric	convert string to numeric	to_number('12,454.8-', '99G999D9S')
	to_timestamp(text, text)	timestamp with time zone	convert string to time stamp	to_timestamp('05 Dec 2000', 'DD Mon YYYY')
	to_timestamp(double precision)	timestamp with time zone	convert UNIX epoch to time stamp	to_timestamp(200120400)

## Numeric Formatting
- Template Patterns for Numeric Formatting
	Pattern	Description
	9	value with the specified number of digits
	0	value with leading zeros
	. (period)	decimal point
	, (comma)	group (thousand) separator
	PR	negative value in angle brackets
	S	sign anchored to number (uses locale)
	L	currency symbol (uses locale)
	D	decimal point (uses locale)
	G	group separator (uses locale)
	MI	minus sign in specified position (if number < 0)
	PL	plus sign in specified position (if number > 0)
	SG	plus/minus sign in specified position
	RN	roman numeral (input between 1 and 3999)
	TH or th	ordinal number suffix
	V	shift specified number of digits (see notes)
	EEEE	scientific notation (not implemented yet)