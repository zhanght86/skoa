package com.thinkgem.jeesite.modules.tasks;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

@Component
@Lazy(value=false)
public class MyQuartzJob {
	/*@Scheduled(cron = "*//*5 * * * * ?")//每隔5秒执行一次
	public void test() throws Exception {
		System.out.println("Test is working......");
	}*/
	// @Scheduled(fixedDelay=1000)  //第一种方式
	// fixedDelay延时多少毫秒，多少毫秒执行一次
    /*
        1 Seconds (0-59)
        2 Minutes (0-59)
        3 Hours (0-23)
        4 Day of month (1-31)
        5 Month (1-12 or JAN-DEC)
        6 Day of week (1-7 or SUN-SAT)
        7 Year (1970-2099)
        取值：可以是单个值，如6；
            也可以是个范围，如9-12；
            也可以是个列表，如9,11,13
            也可以是任意取值，使用*
    */
	// 0 * * * * * 代表每分钟执行一次
    /*
         2011-09-07 09:23:00
        2011-09-07 09:24:00
        2011-09-07 09:25:00
        2011-09-07 09:26:00
     */
	/*@Scheduled(cron="0/1 * * * * ?")
	public void execute() {
		long ms = System.currentTimeMillis();
		System.out.println(ms);
	}*/
}
