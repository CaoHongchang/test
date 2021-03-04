package com.tgb.test;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {

	/*public static void main(String[] args) {
		System.out.println(System.getProperty("${catalina.home}")); 
	}*/
	public static void main(String[] args) {
        String str = "one123";
        String regex = "(?<=one)(?=123)";
        
        System.out.println(regex);
        String[] strs = str.split(regex);
        for (int i = 0; i < strs.length; i++) {
            System.out.printf("strs[%d] = %s%n", i, strs[i]);

        }
    }
	
	public static List<String> extractMessageByRegular(String msg){
		
		List<String> list=new ArrayList<String>();
		Pattern p = Pattern.compile("(\\[[^\\]]*\\])");
		Matcher m = p.matcher(msg);
		while(m.find()){
			list.add(m.group().substring(1, m.group().length()-1));
		}
		return list;
	}

}
