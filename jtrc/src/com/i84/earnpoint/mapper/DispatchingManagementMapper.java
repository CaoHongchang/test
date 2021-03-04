package com.i84.earnpoint.mapper;

import java.util.List;


import com.i84.earnpoint.model.DispatchingManagement;

public interface DispatchingManagementMapper {

	List<DispatchingManagement> selectlist(DispatchingManagementMapper dispatchingManagementMapper);
	DispatchingManagement selectById(String id);
	int updateById(DispatchingManagement record);
}
