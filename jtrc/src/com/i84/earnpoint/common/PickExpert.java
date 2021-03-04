package com.i84.earnpoint.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

public class PickExpert {
	// 年龄判断
	public static int countAge(List<Map<String, Object>> list, int all) {
		int countAge = 0;
		int countAllAge = 0;// 判断所有专家里年龄
		for (int i = 0; i < list.size(); i++) // 判断年龄大于45的总人数
		{
			//if (Integer.parseInt(list.get(i).get("age").toString().substring(0,2)) < 45) {
			if (Double.parseDouble(list.get(i).get("age").toString().substring(0,2)) < 45) {
				if(list.get(i).get("selected").toString().equals("否"))
				countAllAge++;
			}
		}
		if (all / 3 >= countAllAge)// 年龄小于45要小于总数的1/3，不够就按正常流程抽取，不限制年龄大于45的人数
		{
			countAge = 1000;
		}

		return countAge;
	}

	// 将公司数量单独放到list中
	public static List fillCompanyList(List<String> companyList) {
		List<Integer> CompanyCountlist = new ArrayList();
		for (int i = 0; i < companyList.size(); i++) {
			CompanyCountlist.add(0);
		}
		return CompanyCountlist;
	}

	// 判断是否第一次随机
	public static int whetherFirst(List<Map<String, Object>> list, List<Integer> selected) {
		int countSelectedAndEffected = 0;
		int flagOfReRandom = 1;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).get("selected").toString().equals("是")) {
				flagOfReRandom = 0;// 不是第一次
				break;
			}
		}
		if (flagOfReRandom == 0) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).get("selected").toString().equals("是")) {
					selected.add(i);
					if (list.get(i).get("effected").toString().equals("是")) {
						countSelectedAndEffected++;
					}
				}
			}

		}
		return countSelectedAndEffected;
	}

	// 判断是否第一次随机
	public static List whetherFirstList(List<Map<String, Object>> list, List<Integer> selected) {
		int countSelectedAndEffected = 0;
		int flagOfReRandom = 1;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).get("selected").toString().equals("是")) {
				flagOfReRandom = 0;// 不是第一次
				break;
			}
		}
		if (flagOfReRandom == 0) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).get("selected").toString().equals("是")) {
					selected.add(i);
					if (list.get(i).get("effected").toString().equals("是")) {
						countSelectedAndEffected++;
					}
				}
			}

		}
		return selected;
	}

	// 找到上一届评委
	public static List findLastTime(List<Map<String, Object>> list, List<Integer> countEffected) {
		for (int i = 0; i < list.size(); i++) {
			if ("是".equals(list.get(i).get("effected").toString())) {
				countEffected.add(i);
			}
		}
		return countEffected;
	}

	// 判断真正要抽取的人数
	public static List noNeedNumberJudge(List<Map<String, Object>> list2,List<Integer> countEffected, int all, int countSelectedAndEffected) {
		List<Integer> list = new ArrayList<Integer>();
		List<Integer> onlySelected = new ArrayList<Integer>();
		Random rand = new Random();
		int noNeedNumber;
		int needToPick = 0;
		noNeedNumber = rand.nextInt(countEffected.size() / 3 + 1) + countEffected.size() / 3;
		for(int i = 0;i<list2.size();i++)
		{
			
			if(list2.get(i).get("selected").toString().equals("否"))
				if(list2.get(i).get("effected").toString().equals("否"))
					onlySelected.add(i);
		}
		if (countEffected.size() / 3 > all) {
			noNeedNumber = countEffected.size() - all;
		} else {
			while (countEffected.size() - noNeedNumber > all) {

				if (countEffected.size() / 3 >= all) {
					noNeedNumber = countEffected.size() - all;
				} else {
					noNeedNumber = rand.nextInt(countEffected.size() / 3 + 1) + countEffected.size() / 3;
				}
			}
			needToPick = all - countEffected.size() + noNeedNumber;
		}
		if (countEffected.size() - countSelectedAndEffected <= countEffected.size() * 2 / 3) {
			noNeedNumber = countSelectedAndEffected;
			needToPick = all - countEffected.size() + noNeedNumber;
			if (countEffected.size() / 3 > all) {
				needToPick = 0;
			}
		}
		// 可抽取人数小于等于
		if (countSelectedAndEffected > noNeedNumber) {
			noNeedNumber = countEffected.size() - countSelectedAndEffected;
			needToPick = countEffected.size() - noNeedNumber;
		}
		if(needToPick>onlySelected.size())
		{
			int temp;
			temp = needToPick-onlySelected.size();
			needToPick=onlySelected.size();
			noNeedNumber=noNeedNumber-temp;
		}
		
		
		
		list.add(noNeedNumber);
		list.add(needToPick);
		return list;
	}
	// 随机去掉上一届评委
	// public static List lastTimeExpert

	// 判断同单位人数限制
	public static int judgeCompanyLimited(List<String> companyList, List<Map<String, Object>> list,
			List<Integer> CompanyCountlist, int x, int j) {
		int flagOfCompanyLimited = 1;
		if (x != 0) {
			for (int l = 0; l < companyList.size(); l++) {
				if (list.get(j).get("company").toString().equals(companyList.get(l))) {
					if (CompanyCountlist.get(l) >= x) {
						flagOfCompanyLimited = 0;
						break;
					} else {
						flagOfCompanyLimited = 1;
						break;
					}
				}
			}
		}
		return flagOfCompanyLimited;
	}
	
	public static int judgeCompanyLimited2(List<String> companyList, List<Map<String, Object>> list,
			List<Integer> countEffected,List<Integer> CompanyCountlist, int x, int j) {
		int flagOfCompanyLimited = 1;
		if (x != 0) {
			for (int l = 0; l < companyList.size(); l++) {
				if (list.get(countEffected.get(j)).get("company").toString().equals(companyList.get(l))) {
					if (CompanyCountlist.get(l) >= x) {
						flagOfCompanyLimited = 0;
						break;
					} else {
						flagOfCompanyLimited = 1;
						break;
					}
				}
			}
		}
		return flagOfCompanyLimited;
	}

	// 查重
	public static int judgeSelected1(List<Integer> selected, List<Integer> countEffected, int j) {
		int flagOfSelected = 1;
		for (int k = 0; k < selected.size(); k++) {
			if (selected.get(k) == countEffected.get(j)) {
				flagOfSelected = 0;
				break;
			}
		}
		return flagOfSelected;
	}
	
	public static int judgeSelected2(List<Integer> selected, List<Integer> countEffected, int j) {
		int flagOfSelected = 1;
		for (int k = 0; k < selected.size(); k++) {
			if (selected.get(k) == j) {
				flagOfSelected = 0;
				break;
			}
		}
		return flagOfSelected;
	}

	// 抽上一届专家
	public static List pickExpert1(List<Integer> countEffected, List<Integer> selected, List<Integer> CompanyCountlist,
			List<Map<String, Object>> list, List<String> companyList, int flagOfCompanyLimited, int noNeedNumber, int x,
			int countAge, int needToPick, int all) {
		Random rand = new Random();
		List<Integer> onlySelected = new ArrayList<Integer>();
		List<Map<String, Object>> listNew = new ArrayList();
		int flagOfSelected = 1;
		int expertPickAge;
		int q = 0;
		for(int i = 0;i<list.size();i++)
		{
			if(list.get(i).get("selected").toString().equals("否"))
				if(list.get(i).get("effected").toString().equals("否"))
					if(Double.parseDouble(list.get(i).get("age").toString())<45)
						onlySelected.add(i);
		}
		expertPickAge= all/3-onlySelected.size();
		for (int i = 0; i < (countEffected.size() - noNeedNumber); i++) {
			q++;
			if(q>100000)
			{
				return listNew;
			}
			int j = rand.nextInt(countEffected.size());
			flagOfSelected = PickExpert.judgeSelected1(selected, countEffected, j);
			// 判断同单位人数
			flagOfCompanyLimited = PickExpert.judgeCompanyLimited2(companyList, list, countEffected,CompanyCountlist, x, j);

			if (flagOfCompanyLimited == 1) {
				if (flagOfSelected == 1) {
					if(expertPickAge<=0){
						selected.add(countEffected.get(j));
						listNew.add(list.get(countEffected.get(j)));
						for (int l = 0; l < companyList.size(); l++) {
							
							if (list.get(countEffected.get(j)).get("company").toString().equals(companyList.get(l))) {
								CompanyCountlist.set(l, CompanyCountlist.get(l) + 1);
							}
						}
						//if (Integer.parseInt(list.get(countEffected.get(j)).get("age").toString()) < 45) {
						if (Double.parseDouble(list.get(countEffected.get(j)).get("age").toString()) < 45) {		
						countAge++;
					}
					}
					else {
						if (Double.parseDouble(list.get(countEffected.get(j)).get("age").toString()) < 45) {		
							expertPickAge--;
							countAge++;
							selected.add(countEffected.get(j));
							listNew.add(list.get(countEffected.get(j)));
							for (int l = 0; l < companyList.size(); l++) {
								
								if (list.get(countEffected.get(j)).get("company").toString().equals(companyList.get(l))) {
									CompanyCountlist.set(l, CompanyCountlist.get(l) + 1);
								}
							}
						}
						else {
							i--;
						}
					}
					
				} else {
					flagOfSelected = 1;
					i--;
					continue;
				}
			} else {
				flagOfCompanyLimited = 1;
				i--;
				continue;
			}
		}
		
		/////////////////////
		int p=0;
		for (int i = 0; i < needToPick; i++) {
			p++;
			if(p>1000000)
			{
				return listNew;
			}
			// 先满足年龄的条件
			if (countAge < all / 3) {
				int j = rand.nextInt(list.size());
				//if (Integer.parseInt(list.get(j).get("age").toString()) < 45) {
				if (Double.parseDouble(list.get(j).get("age").toString()) < 45) {	
					flagOfSelected = PickExpert.judgeSelected2(selected, countEffected, j);
					flagOfCompanyLimited = PickExpert.judgeCompanyLimited(companyList, list, CompanyCountlist, x, j);
					if (flagOfCompanyLimited == 1) {
						if (flagOfSelected == 1) {
						if (list.get(j).get("effected").toString().equals("否"))	{
							selected.add(j);
							listNew.add(list.get(j));
							for (int l = 0; l < companyList.size(); l++) {
								if (list.get(j).get("company").toString().equals(companyList.get(l))) {
									CompanyCountlist.set(l, CompanyCountlist.get(l) + 1);
								}
							}
							countAge++;
							}
							else{
								i--;
							}
						} else {
							flagOfSelected = 1;
							i--;
						}
					} else {
						flagOfCompanyLimited = 1;
						i--;
					}

				} else {
					i--;
					continue;
				}
			} else {// 满足年龄条件之后
				int j = rand.nextInt(list.size());
				flagOfSelected = PickExpert.judgeSelected2(selected, countEffected, j);
				flagOfCompanyLimited = PickExpert.judgeCompanyLimited(companyList, list, CompanyCountlist, x, j);
				if (flagOfCompanyLimited == 1) {
					if (flagOfSelected == 1) {
						if (list.get(j).get("effected").toString().equals("否"))	{
						selected.add(j);
						listNew.add(list.get(j));
						for (int l = 0; l < companyList.size(); l++) {
							if (list.get(j).get("company").toString().equals(companyList.get(l))) {
								CompanyCountlist.set(l, CompanyCountlist.get(l) + 1);
							}
						}
						}
						else{
							i--;
						}
					} else {
						flagOfSelected = 1;
						i--;
					}
				} else {
					flagOfCompanyLimited = 1;
					i--;
				}
			}
		}
		return listNew;
	}
	/*
	 * //抽本届专家 public static List pickExpert2() {}
	 */
}
