
//计算配货日历，每晚12点以后执行，所以包含今天
public void calcDistCalendar(){
	if( log.isDebugEnabled() ){
		log.debug( "计算配货日历定时器开始执行！" );
	}
	Map distWeekCalendar = getDistWeekCalendar();
	Map distMonthCalendar = getDistMonthCalendar();

	//循环工业公司有业务往来且是定时配货的商业公司，根据配货日计算发货日和到货日
	List comDistDates = V6SqlUtils.getSession.selectList( "getRegularDistComs", getIcomid() );
	if( log.isDebugEnabled() ){
		log.debug( "计算配货日历定时器执行的商业公司日期数据 == " + comDistDates );
	}
	for( Object comDistDate : comDistDates ){
		Map comDistDateTmp = ( Map )comDistDate;
		String periodType = ( String )comDistDateTmp.get( "PERIOD_TYPE" );
		String distDay = comDistDateTmp.get( "DIST_DAY" ) + "";
		if( "10".equals( periodType ) ){ //周配
			String distDate = distWeekCalendar.get( distDay );
			saveDistCalendar( comDistDateTmp, distDate );
		}else{ //月配
			String distDate = distMonthCalendar.get( distDay );
			saveDistCalendar( comDistDateTmp, distDate );
		}
	}
	if( log.isDebugEnabled() ){
		log.debug( "计算配货日历定时器执行结束！" );
	}
}

//api返回的周日的值是0,需要转成7
private int dealWeekDay( int weekDay ){
	return weekDay == 0 ? 7 : weekDay;
}

//获取周对应日期数据，返回数据格式{"3":"20160101","4":"20160102"...}
private Map getDistWeekCalendar(){
	Map distCalendar = new HashMap();
	String beginDay = DateTool.getToday();
	int weekDay = DateTool.getWeekday( beginDay );
	distCalendar.put( dealWeekDay( weekDay ) +"", beginDay );
	for( int i = 1; i < 7; i++ ){
		String tempDay = DateTool.getBeforeOrNextDay( beginDay, i );
		weekDay = DateTool.getWeekday( tempDay );
		distCalendar.put( dealWeekDay( weekDay ) + "", tempDay );
	}
	return distCalendar;
}

//获取周对应日期数据，返回数据格式{"22":"20160122","23":"20160123"...}
private Map getDistMonthCalendar(){
	Map distCalendar = new HashMap();
	String beginDay = DateTool.getToday();
	int day = Integer.valueOf( beginDay.substring( 6, 8 ) ); //处理 01
	distCalendar.put( day +"", beginDay );
	for( int i = 1; i < 7; i++ ){
		String tempDay = DateTool.getBeforeOrNextDay( beginDay, i );
		day = Integer.valueOf( beginDay.substring( 6, 8 ) ); //处理 01
		distCalendar.put( day + "", tempDay );
	}
	return distCalendar;
}

//周配插入
private void saveDistCalendar( comDistDateTmp, distDate ){
	String distSendDays = comDistDateTmp.get( "DIST_SEND_DAYS" ) + "";
	String transitDays = comDistDateTmp.get( "TRANSIT_DAYS" ) + "";
	Map distDay = new HashMap();
	distDay.putAll( comDistDateTmp );
	distDay.put( "distDate", distDate );
	String sendDate = DateTool.getBeforeOrNextDay( distDay, Integer.valueOf( distSendDays ) );
	String receiveDate = DateTool.getBeforeOrNextDay( sendDate, Integer.valueOf( transitDays ) );
	distDay.put( "sendDate", sendDate );
	distDay.put( "receiveDate", receiveDate );
	V6SqlUtils.getSqlSession().insert( "saveDistCalendar", distDay );
}

//定时器计算基础表
public void calcDistBase(){
	if( log.isDebugEnabled() ){
		log.debug( "定时器计算基础表开始执行！" );
	}
	//获取工业下所有的业务往来商业公司|基准库存日
	List comBaseDates = V6SqlUtils.getSession.selectList( "getComsBaseDateDatas", getIcomid() );
	if( log.isDebugEnabled() ){
		log.debug( "定时器计算基础表公司基准日期数据 == " + comBaseDates );
	}
	for( Object comBaseDate : comBaseDates ){
		Map comBaseDateTmp = ( Map )comBaseDate;
		String baseDate = ( String )comBaseDateTmp.get( "DATE1" );
		String today = DateTool.getToday();
		int diff = DateTool.diffDay( baseDate, today );
		comBaseDate.put( "diff", diff-1 );
		int daysToCalcAver = Integer.valueOf( comBaseDateTmp.get( "AVERAGE_SALES_DAYS" )+"" )
		String beginDate = DateTool.getBeforeOrNextDay( baseDate, 1-daysToCalcAver );
		comBaseDateTmp.put( "BEGIN_DATE", beginDate );
		List comItemList = V6SqlUtils.getSqlSession().selectList( "getDistCalcBaseData", comBaseDateTmp ); //每个商业公司的计算基础表数据
		Map map = new HashMap();
		map.put( "comItemList", comItemList );
		V6SqlUtils.getSqlSession().insert( "saveDistCalcBaseData", map ); //执行Merge into
	}
	if( log.isDebugEnabled() ){
		log.debug( "定时器计算基础表执行结束！" );
	}
}

//先按单工业来写逻辑，以后如果集中部署，再说以后。。。
private String getIcomid(){
	List icomIds = V6SqlUtils.getSqlSession().selectList( "getIcomId" );
	return icomIds.get( 0 );
}