package com.i84.earnpoint.zcps.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.mapper.ExpertActivityInfoMapper;
import com.i84.earnpoint.mapper.ResourceMapper;
import com.i84.earnpoint.mapper.UserExpertInfoMapper;
import com.i84.earnpoint.mapper.ZcActivityGetMapper;
import com.i84.earnpoint.mapper.ZcDissertationInfoMapper;
import com.i84.earnpoint.mapper.ZcDissertationScoreMapper;
import com.i84.earnpoint.model.ExpertAssignWorkPo;
import com.i84.earnpoint.model.Resource;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.ZcActivityGet;
import com.i84.earnpoint.model.ZcDissertationInfo;
import com.i84.earnpoint.model.ZcDissertationScore;
import com.i84.earnpoint.zcps.service.ExpertDissertationInfoService;

@Service
public class ExpertDissertationInfoServiceImpl extends BaseService implements
ExpertDissertationInfoService {

    @Autowired
    private ZcActivityGetMapper zcActivityGetMapper;

    @Autowired
    private ExpertActivityInfoMapper expertActivityInfoMapper;

    @Autowired
    private ZcDissertationInfoMapper zcDissertationInfoMapper;

    @Autowired
    private ZcDissertationScoreMapper zcdissertationscoremapper;

    @Autowired
    private UserExpertInfoMapper userExpertInfoMapper;
    @Autowired
    private ResourceMapper resourceMapper;
    StringBuffer                      pbf = new StringBuffer();
    String                            old = "";
    @Override
    public List<Map<String, Object>> listSamePointAndDifferentMajorExperts(
            Integer sid, Integer activityId, List<Integer> expertIds) {

        Map<String, Object> param = new HashMap<String, Object>();
        ZcActivityGet zcActivityGet = zcActivityGetMapper
                .selectByPrimaryKey(sid);
        if (zcActivityGet != null) {
            String company = zcActivityGet.getWorkName();// 工作单位
            String major = zcActivityGet.getsPro();// 申报专业
            param.put("company", company);
            param.put("major", major);
            param.put("activityId", activityId);
            param.put("expertIds", expertIds);
            return expertActivityInfoMapper
                    .listUserExpertInfoBySelective(param);
        }
        return new ArrayList<Map<String, Object>>();
    }

    @Override
    public String autoAssignExperts(Map<String, Object> param) {
        JSONObject object = new JSONObject();
        Integer uid = TextUtil.getInt(param.get("uid"));// 录入人
        if (param.get("activityId") == null) {
            object.put("flag", false);
            object.put("cause", "传入的参数错误！");
            return response(object);
        }
        if (uid == 0) {
            object.put("flag", false);
            object.put("cause", "后台录入人尚未登录");
            return response(object);
        }
        // 查询某个活动的申报者
        List<Map<String, Object>> list = zcActivityGetMapper
                .selectZCPSBaseInfoList(param);
        if (list.size() != 0) {
            Date current = new Date();
            boolean flag = false,haveDissertation=true,isHaveDissertation=false;
            String dissertationMsg="下列申报者没有论文：<br/>";
            String checkMsg="暂无可分配的论文";

            //			String checkMsg="下列申报者未审核或审核未通过：<br/>";
            for (Map<String, Object> item : list) {
                Integer sid = TextUtil.getInt(item.get("ugId"));// 职称评审活动申报信息Id
                Integer activityId = TextUtil.getInt(item.get("agId"));// 职称评审活动Id
                Integer suid = TextUtil.getInt(item.get("suid"));// 申报人的Id
                String state = TextUtil.getString(item.get("sState"));
                String pnum =TextUtil.getString(item.get("pnum"));
                if(!"1".equals(state)){
                    //					checkMsg+=pnum+"<br/>";
                    //					haveChecked=false;
                    continue;
                }
                // 申报人论文查询条件
                Map<String, Object> query = new HashMap<String, Object>();
                query.put("activityId", activityId);// 活动Id
                query.put("uid", suid);// 申报人Id
                // 查询该申报人的申报论文
                List<Map<String, Object>> userDisInfos = zcDissertationInfoMapper
                        .selectSBDissertaionInfo(query);
                if(userDisInfos.size()==0){
                    dissertationMsg+=pnum+"<br/>";
                    haveDissertation=false;
                    continue;
                }
                for (Map<String, Object> userDisInfo : userDisInfos) {
                    Integer disInfoId = TextUtil.getInt(userDisInfo.get("id"));// 论文日志Id
                    // 查询已经分配的专家
                    List<Integer> expertIds = zcdissertationscoremapper
                            .selectDissertationAssign(disInfoId);
                    //如果分配专家超过两位则不会再进行分配
                    if(expertIds.size()>=2){
                        haveDissertation=false;
                        continue;
                    }
                    //表示当前有需要分配的论文
                    isHaveDissertation=true;
                    // 查找不同单位同专业的专家
                    List<Map<String, Object>> expertInfos = listSamePointAndDifferentMajorExperts(
                            sid, activityId, expertIds);
                    if (expertInfos.size() >= 2) {
                        haveDissertation=false;
                        Map<String, Object> temp = firstAssign(expertInfos);
                        if (temp != null) {
                            flag = true;
                            // 随机一个专家
                            Integer expertId = TextUtil.getInt(temp.get("id"));// 专家的id
                            // 插入数据专家论文信息
                            insertExpertDissertation(expertId, disInfoId, uid,
                                    current);
                            // 移除随机过的专家
                            expertInfos.remove(temp);
                            // 随机另一个专家
                            Map<String, Object> another = firstAssign(expertInfos);
                            if (another != null) {
                                expertId = TextUtil.getInt(another.get("id"));
                                // 插入数据专家论文信息
                                insertExpertDissertation(expertId, disInfoId,
                                        uid, current);
                            }
                            // 将随机过的专家再次添加到List，下次继续使用
                            expertInfos.add(temp);
                            Map map=zcDissertationInfoMapper.getlwfpcs(disInfoId);
                            if(map.get("f_num")==null) {
                                map.put("f_num", 1);
                            }
                            else {
                                map.put("f_num", (Integer)map.get("f_num")+1);
                            }
                            zcDissertationInfoMapper.lwfpcs(map);
                        }
                    }

                }

            }
            if (flag) {
                object.put("flag", true);
            } else {
                object.put("flag", false);
                if(haveDissertation) {
                    object.put("cause", "专家数量不够或者没有匹配到合适的专家！");
                }
                else if(!isHaveDissertation){
                    object.put("cause", checkMsg);
                }
                else {
                    object.put("cause", dissertationMsg);
                }
            }

        } else {
            object.put("flag", false);
            object.put("cause", "当前活动尚未有人申报！");
        }
        return response(object);
    }

    /**
     * 随机分配专家
     * 
     * @param list
     * 
     *            public Map<String, Object> firstAssign(List<Map<String, Object>> list) { if (list.size() == 0) { return null; } int index = (int) (Math.random() * (list.size() - 1)); return
     *            list.get(index); }
     */
    /**
     * 随机分配专家
     * 
     * @param list
     */
    public Map<String, Object> firstAssign(List<Map<String, Object>> list) {
        if (list.size() == 0) { return null; }
        return list.get(0);
    }

    /**
     * 插入专家论文信息
     * 
     * @param expertId
     * @param rId
     * @param uid
     * @param addDate
     * @return
     */
    public int insertExpertDissertation(Integer expertId, Integer rId, Integer uid, Date addDate) {

        ZcDissertationScore record = new ZcDissertationScore();
        record.setExpertId(expertId);
        record.setrId(rId);
        record.setStaff(uid);
        record.setAddDate(addDate);
        return zcdissertationscoremapper.insertSelective(record);
    }

    @Override
    public List<Map<String, Object>> listExpertDissertationInfos(
            Map<String, Object> params) {

        return zcdissertationscoremapper.selectExpertDissertationInfo(params);
    }

    @Override
    public List<ExpertAssignWorkPo> listExpertAssignWorkPos(Integer activityId) {

        return zcdissertationscoremapper.selectHasAssignTaskExperts(activityId);
    }

    @Override
    public String deleteAllAssignedExperts(Integer activityId) {

        JSONObject object = new JSONObject();
        try {
            int count = zcdissertationscoremapper
                    .deleteAllAssignedExperts(activityId);
            if (count > 0) {
                object.put("flag", true);
                object.put("cause", "删除所有论文分配的专家成功！");
            } else {
                object.put("flag", false);
                object.put("cause", "当前没有可以删除的分配信息！");
            }
        } catch (Exception e) {
            object.put("flag", false);
            object.put("cause", e.getLocalizedMessage());
        }
        return response(object);
    }

    @Override
    public String autoAssignExpertsAgain(Map<String, Object> param) {

        JSONObject object = new JSONObject();
        Integer uid = TextUtil.getInt(param.get("uid"));// 录入人
        if (param.get("activityId") == null) {
            object.put("flag", false);
            object.put("cause", "传入的参数错误！");
            return response(object);
        }
        if (uid == 0) {
            object.put("flag", false);
            object.put("cause", "后台录入人尚未登录");
            return response(object);
        }
        Integer activityId = TextUtil.getInt(param.get("activityId"));

        StringBuffer bf = new StringBuffer();
        // 2次分配
        String checkMsg = "分配数据:<br/>";
        String dissertationMsg = "下列论文不符合2次分配逻辑:<br/>";
        // 查询所有论文
        List<Map<String, Object>> plist = zcdissertationscoremapper.getAllpaperByActivityId(activityId);

        int fplw = 0;
        int fpcs = 0;
        Date current = new Date();
        checkMsg += "一共" + plist.size() + "篇论文<br/>";
        // 循环
        for (int i = 0; i < plist.size(); i++) {
            Map<String, Object> p = plist.get(i);

            Integer rid = TextUtil.getInt(p.get("id"));
            // 查询论文成绩
            List<Map<String, Object>> slit = zcdissertationscoremapper.getAllscoreByR_id(rid);

            /*
             * 成绩1		成绩2	处理
             * 合格以上	不合格	分配一次
             * 不合格	不合格	不分配
             * 合格以上	没成绩	分配一次
             * 不合格	没成绩	分配2次
             * 没成绩	没成绩	分配2次
             */
            //判断分配次数
            int num = 0;
            bf.append("============================ks\n\t");
            if (slit.size() != 2) {
                dissertationMsg += p.get("dissetation_name") + " : " + slit.size() + " 次分配数<br/>";
                continue;
            }

            int s0 = TextUtil.getInt(slit.get(0).get("p_score"));
            int s1 = TextUtil.getInt(slit.get(1).get("p_score"));
            bf.append("==============成绩>" + p.get("id") + " : " + p.get("dissetation_name") + " s0=" + s0 + " s1=" + s1);
            bf.append("\n\t");
            //没成绩   没成绩 分配2次
            if (s0 == 0 & s1 == 0)
            {
                num = 2;
            }
            else if (s0 == 0 || s1 == 0)
            {
                int hs = s0 == 0 ? s1 : s0;
                // 1: "优秀"; 2: "良好"; 3 "合格"; 4: "不合格";
                //不合格 没成绩 分配2次
                if (hs == 4)
                {
                    num = 2;
                }else {
                    num = 1;
                }

            } //不合格   不合格 不分配
            else if (s0 == 4 & s1 == 4) {
                num = 0;
            }//合格以上    不合格 分配一次
            else if (s0 == 4 || s1 == 4) {
                num = 1;
            }

            bf.append("==============num>" + num);
            bf.append("\n\t");
            if (num == 0)
            {
                //bf.append("==============跳过循环>" + p.get("id") + " : " + p.get("dissetation_name"));
                //bf.append("\n\t");
                //跳过循环
                continue;
            }
            else {
                fplw++;
                fpcs += num;
                //计算 专家平均论文数+1
                //int vnum = zcdissertationscoremapper.getVnum() + 1;
                //分配专家
                bf.append("==============分配专家>" + p.get("id") + " : " + p.get("dissetation_name"));
                bf.append("\n\t");
                //获取所分配数小于平均数的专家  (查找不同单位同专业的专家) 上次没分配过的

                Integer disInfoId = TextUtil.getInt(p.get("id"));// 论文日志Id

                List<Map<String, Object>> expertInfos = listSamePointAndDifferentMajorExpertsAndVname(TextUtil.getInt(p.get("gid")), TextUtil.getInt(p.get("id")), activityId);

                // 随机一个专家
                Map<String, Object> temp = firstAssign(expertInfos);
                Integer expertId = null;
                if (temp != null) {
                    expertId = TextUtil.getInt(temp.get("id"));
                }
                else {
                    dissertationMsg += p.get("id") + " : " + p.get("dissetation_name") + " : 专家数量不够或者没有匹配到合适的专家！<br/>";
                    continue;
                }

                // 插入数据专家论文信息
                insertExpertDissertation(expertId, disInfoId, uid, current);
                updateExpertReviewTime(expertId);
                //如果是要2次
                if (num == 2) {
                    expertInfos.remove(temp);
                    //pbf.append(old);
                    // 随机另一个专家
                    Map<String, Object> temp2 = firstAssign(expertInfos);
                    // 插入数据专家论文信息
                    if (temp2 != null) {
                        expertId = TextUtil.getInt(temp2.get("id"));
                    }
                    else {
                        dissertationMsg += p.get("id") + " : " + p.get("dissetation_name") + " : 2次专家数量不够或者没有匹配到合适的专家！<br/>";
                        continue;
                    }
                    bf.append("==============分配专家2>" + p.get("id") + " : " + p.get("dissetation_name"));
                    bf.append("\n\t");
                    insertExpertDissertation(expertId, disInfoId, uid, current);
                    updateExpertReviewTime(expertId);
                }
            }
        }
        checkMsg += "分配论文数量" + fplw + "<br/>";
        checkMsg += "分配论文次数" + fpcs + "<br/>";
        object.put("cause", checkMsg + dissertationMsg);
        bf.append(checkMsg + dissertationMsg);
        bf.append("\n\t");
        //System.out.println(bf);
        //System.out.println(pbf);
        return response(object);
    }

    //获取所分配数小于平均数的专家  (查找不同单位同专业的专家)
    public List<Map<String, Object>> listSamePointAndDifferentMajorExpertsAndVname(Integer gid, Integer did, Integer activityId) {

        Map<String, Object> param = new HashMap<String, Object>();
        ZcActivityGet zcActivityGet = zcActivityGetMapper.selectByPrimaryKey(gid);

        if (zcActivityGet != null) {
            String company = zcActivityGet.getWorkName();// 工作单位
            String major = zcActivityGet.getsPro();// 申报专业
            param.put("company", company);
            param.put("major", major);
            param.put("activityId", activityId);
            param.put("did", did);
            //old = major + "\n\t";
            //pbf.append(old);
            return expertActivityInfoMapper.listUserExpertInfoBySelectiveAndVname(param);
        }
        return new ArrayList<Map<String, Object>>();
    }

    @Override
    public List<Map<String, Object>> queryDissertationAssign(
            Map<String, Object> param) {


        return zcDissertationInfoMapper
                .selectDissertationExpertAssignInfos(param);
        // return expertDissertationInfoMapper.selectDissertationAssign(param);
    }

    @Override
    public UserExpertInfo selectUserExpertInfoById(Integer expertId) {

        return userExpertInfoMapper.selectByPrimaryKey(expertId);
    }

    @Override
    public ZcDissertationInfo selectZcDissertationInfoByPno(String pno) {

        return zcDissertationInfoMapper.selectDissertationInfoByPno(pno);
    }

    @Override
    public int delectDissertationAssign(ZcDissertationScore record) {

        return zcdissertationscoremapper.delectDissertationAssign(record);
    }

    @Override
    public int updateDissertationAssign(ZcDissertationScore record) {

        return zcdissertationscoremapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int insertDissertationAssign(ZcDissertationScore record) {

        return zcdissertationscoremapper.insertSelective(record);
    }

    /**
     * 更新专家评审时间
     */
    public void updateExpertReviewTime(Integer expertId) {
        Resource resource = resourceMapper.selectParameterByCode("CSPSSJ");
        Integer initTime = TextUtil.getInt(resource.getExt3());
        UserExpertInfo record = new UserExpertInfo();
        record.setId(expertId);
        record.setInitTime(initTime);
        record.setOtherTime(initTime);
        record.setLoginDate(new Date());
        userExpertInfoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public UserExpertInfo selectUserExpertInfoByZpno(String zpno) {

        return userExpertInfoMapper.selectUserExpertInfoByZpno(zpno);
    }

    @Override
    public String cloaseScore(Map<String, Object> param) {

        JSONObject object = new JSONObject();
        // Integer uid = TextUtil.getInt(param.get("uid"));// 录入人
        if (param.get("activityId") == null) {
            object.put("flag", false);
            object.put("cause", "传入的参数错误！");
            return response(object);
        }
        Integer aId = TextUtil.getInt(param.get("activityId"));// 录入人
        zcdissertationscoremapper.cloaseScore(aId);
        object.put("flag", true);
        return response(object);
    }



}
