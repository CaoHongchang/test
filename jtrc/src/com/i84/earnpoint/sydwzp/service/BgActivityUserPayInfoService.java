package com.i84.earnpoint.sydwzp.service;

import java.util.List;
import java.util.Map;

public interface BgActivityUserPayInfoService {
	
    /**
     * 设置订单id
     * @param uid
     * @return
     */
    String orderInfo(int uid,String need_m);
    
    List<Map<String,Object>> userPayList(Map<String, Object> param);
 
    void test();
}
