package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具
 * @author admin
 *
 */
public class DateUtil {
	
	/** 字符串格式 */
	private static String pattern;
	
    /**
     * 格式化日期
     * @param date 日期对象
     * @return String 
     */
    public static String format(Date date){
    	
    	//设置字符串格式, 判断是否有外部指定
    	boolean hasPattern = pattern();
    	
    	//按照格式将日期对象转换成字符串
        String str = new SimpleDateFormat(pattern).format(date);
        
        //判断, 当没有指定字符串格式, 并且时分秒是否都为0时, 去除时分秒
        if(!hasPattern && str.indexOf("00:00:00") != -1){
            //如果都为0, 则将时分秒从字符串中去除
            str = str.substring(0, str.indexOf(" ")+1);
        }
        
        pattern = null;
        
        return str;
    }
    
    /**
     * 格式化日期<br>
     * 指定字符串格式
     * @param date 日期对象
     * @param pattern 字符串格式
     * @return String
     */
    public static String format(Date date, String pattern){
    	//设置字符串格式
    	DateUtil.pattern = pattern;
    	//返回格式化的结果
    	return format(date);
    }

    /**
     * 将字符串转换成日期
     * @param time 日期内容
     * @return Date
     * @throws Exception 
     */
    public static Date parse(String time) throws Exception{
    	
        Date date = null;
        
        //设置字符串格式, 判断是否有外部指定
    	boolean hasPattern = pattern();
        
        try {
            //按照字符串参数time有时分秒的格式转换
            date = new SimpleDateFormat(pattern).parse(time);
            pattern = null;
        } catch (ParseException e) {
        	pattern = null;
        	//判断, 是否有外部指定的字符串格式
        	if(!hasPattern) {
        		try {
        			//当无法按照有时分秒的格式转换时, 按照无时分秒的格式转换
        			date = new SimpleDateFormat("yyyy-MM-dd").parse(time);
        		} catch (ParseException e1) {
        			throw new Exception("字符串内容有误, 无法转换成日期对象");
        		}
        	}else {
        		throw new Exception("字符串内容有误, 无法转换成日期对象");
        	}
        }
        return date;
    }
    
    /**
     * 将字符串转换成日期<br>
     * 指定字符串格式
     * @param time 日期内容
     * @param pattern 字符串格式 
     * @return Date
     * @throws Exception 
     */
    public static Date parse(String time, String pattern) throws Exception{
    	//设置字符串格式
    	DateUtil.pattern = pattern;
    	//转换日期对象
    	return parse(time);
    }
    
    /**
     * 设置字符串格式
     * @return 是否有指定的格式true/false
     */
    private static boolean pattern() {
    	
    	//判断, 是否有指定的字符串格式
    	if(pattern != null) return true;
    	
    	//没有指定, 则使用默认格式
    	pattern = "yyyy-MM-dd HH:mm:ss";
    	
    	return false;
    }
}
